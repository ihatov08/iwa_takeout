class ApplicationController < ActionController::Base
  before_action :enable_image_url

  private

  def enable_image_url
    if params[:enable_image_url]
      session[:enable_image_url] ||= "enabled"
    end
  end
end
