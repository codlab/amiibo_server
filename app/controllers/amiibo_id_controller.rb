class AmiiboIdController < ApplicationController
  def list
    respond_with {:revision => Revision.order("revision DESC ").first.revision,
        :amiibos => AmiiboId.all, :apk => { :version => 1, :url => "http://amiibo.codlab.eu/amiibo_1.apk"}}
  end
end
