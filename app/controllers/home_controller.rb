class HomeController < ApplicationController
  def index
    @q = Listing.published.ransack(params[:q])
  end
end
