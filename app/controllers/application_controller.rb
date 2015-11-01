class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :html, :json, :text, :pdf
  before_filter :default_format, :set_header, :check_seed

  CURRENT_REVISION = 3

  def default_format
    logger.info(params[:format])
    request.format = "json" unless params[:format]
  end

  def set_header
    if params[:format].blank?
      headers["Content-Type"] = "text/plain"
    end
  end

  def check_seed

    if Revision.count == 0 or Revision.order("revision DESC").first.revision < CURRENT_REVISION
      connection = ActiveRecord::Base.connection

      connection.execute "TRUNCATE revisions RESTART IDENTITY"
      connection.execute "TRUNCATE amiibo_ids RESTART IDENTITY"

      insert_if_not_exists_revision(connection, 1)
      insert_if_not_exists_revision(connection, 2)

      insert_if_not_exists(connection, "Toad", "000a000000380102")
      insert_if_not_exists_revision(connection, 3)
    end
  end

  private

  def insert_if_not_exists(connection, name, identifier)
    count = connection.execute "select count(*) from amiibo_ids where identifier = '#{identifier}'"
    count = count.to_a
    count = count[0][0].to_i

    logger.info("count #{count}")
    if count == 0
      connection.execute "insert into amiibo_ids (identifier, name, created_at, updated_at) values ('#{identifier}', '#{name}', '#{Time.now}', '#{Time.now}')"
    end
  end

  def insert_if_not_exists_revision(connection, revision)
    count = connection.execute "select count(*) from revisions where revision = #{revision}"
    count = count.to_a
    logger.info("count revision #{count}")
    if count == 0
      connection.execute "insert into revisions (revision, created_at, updated_at) values (#{revision}, '#{Time.now}', '#{Time.now}')"
    end
  end
end
