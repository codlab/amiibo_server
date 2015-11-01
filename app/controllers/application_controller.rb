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
      logger.info("#{Revision.order("revision DESC").first.revision}")
    if Revision.count == 0 or Revision.order("revision DESC").first.revision < CURRENT_REVISION
      Revision.destroy_all
      AmiiboId.destroy_all

      insert_if_not_exists_revision(1)
      insert_if_not_exists_revision(2)

      insert_if_not_exists("Toad", "000a000000380102")
      insert_if_not_exists_revision(3)
    end
  end

  private

  def insert_if_not_exists(name, identifier)
    amiibo = AmiiboId.where(:identifier => identifier).first
    logger.info("#{amiibo}")
    AmiiboId.create(:name => name, :identifier => identifier) if amiibo.nil?
  end

  def insert_if_not_exists_revision(revision)
    revision = Revision.where(:revision => revision).first
    logger.info("#{revision}")
    Revision.create(:revision => revision) if revision.nil?
  end
end
