class HomeController < ApplicationController
  def index
    @q = Listing.ransack(params[:q])
  end
end
