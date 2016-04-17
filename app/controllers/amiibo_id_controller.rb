class AmiiboIdController < ApplicationController
  def list
    amiibos = []
    amiibos_db = AmiiboId.all
    amiibos_db.each do |amiibo|
        amiibos << {:name => amiibo.name, :identifier => amiibo.identifier}
    end

    render :json => {
      :amiibos => amiibos,
      :revision => Revision.last.revision,
      :apk => { :version => 6, :url => "http://amiibo.codlab.eu/amiibo.apk"},
      :stats => ApiController.stat_json      
    }
  end
end
