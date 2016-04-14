class AmiiboIdController < ApplicationController
  def list
    hash = Hash.new
    hash[:revision] = Revision.last.revision
    hash[:apk] = { :version => 6, :url => "http://amiibo.codlab.eu/amiibo.apk"}
    amiibos = []
    amiibos_db = AmiiboId.all
    amiibos_db.each do |amiibo|
        amiibos << {:name => amiibo.name, :identifier => amiibo.identifier}
    end
    hash[:amiibos] = amiibos

    respond_with hash
  end
end
