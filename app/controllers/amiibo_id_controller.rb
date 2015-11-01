class AmiiboIdController < ApplicationController
  def list
    hash = Hash.new
    hash[:revision] = Revision.order("revision DESC ").first.revision
    hash[:amiibos] = AmiiboId.all
    hash[:apk] = { :version => 1, :url => "http://amiibo.codlab.eu/amiibo_1.apk"}

    respond_with hash
  end
end
