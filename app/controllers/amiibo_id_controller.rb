class AmiiboIdController < ApplicationController
  def list
    hash = Hash.new
    hash[:revision] = Revision.order("revision DESC ").first.revision
    hash[:apk] = { :version => 5, :url => "http://amiibo.codlab.eu/amiibo.apk"}
    amiibos = []
    amiibos_db = AmiiboId.all
    amiibos_db.each do |amiibo|
        amiibos << {:name => amiibo.name, :identifier => amiibo.identifier}
    end
    hash[:amiibos] = amiibos

    respond_with hash
  end
end
