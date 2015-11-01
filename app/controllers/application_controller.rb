class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :html, :json, :text, :pdf
  before_filter :default_format, :set_header


  def default_format
    logger.info(params[:format])
    request.format = "json" unless params[:format]
  end

  def set_header
    if params[:format].blank?
      headers["Content-Type"] = "text/plain"
    end
  end
end
