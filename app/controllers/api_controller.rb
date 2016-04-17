class ApiController < ApplicationController

  def encrypt
    operation("encrypt", "-e")
  end

  def decrypt
    operation("decrypt", "-d")
  end

  def stats
    render :json => ApiController.stat_json
  end

  def self.stat_json
    {
      :encrypt => self.get_encrypt.input_count,
      :decrypt => self.get_decrypt.input_count
    }
  end

  private

  def operation(type, option)
    error = false
    begin
      if not params.nil? and params.has_key?(:data)
        data = params[:data]
        if data.size >= 520 and data.size <= 540
          prepare_directory("tmp/files")

          name = "#{SecureRandom.uuid}.bin"
          path = File.join("tmp/files", name)
          File.open(path, "wb") do |f|
            f.write(data.read)
          end

          having_errors = false
          IO.popen("amiitool/build/amiitool #{option} -k keys.bin -i tmp/files/#{name} -o tmp/files/#{name}") do |f|
            data = nil
            data = f.gets if not f.nil?
            error = true if not data.nil? and data.length > 0
          end

          File.open(path, "r") { |f| send_data f.read, type: "binary/octet-stream" }
          File.delete(path)

          increment(type)
        else
          render :json => { :message => "invalid data size", :error => -2}, :status => 422
        end
      else
        error = true
      end
    #rescue
    #  error = true
    end
    render :json => { :message => "missing data", :error => -1} if error, :status => 422
  end

  def prepare_directory(directory)
    FileUtils.mkdir_p(directory) unless File.directory?(directory)
  end

  def self.get_encrypt
    ApiController.create_io(1)
  end

  def self.get_decrypt
    ApiController.create_io(0)
  end

  def self.create_io(input_type)
    io = Io.where(:input_type => input_type).first
    io = Io.create(:input_type => input_type) if io.nil?
    if io.input_count.nil?
      io.input_count = 0
      io.save
    end
    io
  end

  def increment(type)
    io = nil
    io = ApiController.get_encrypt if type == "encrypt"
    io = ApiController.get_decrypt if type == "decrypt"
    io.input_count+=1
    io.save
  end

end
