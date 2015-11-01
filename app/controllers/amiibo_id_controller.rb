class AmiiboIdController < ApplicationController
  def list
    respond_with :json => {:revision => Revision.order("revision DESC ").first.revision,
        :amiibos => AmiiboId.all}
  end
end
