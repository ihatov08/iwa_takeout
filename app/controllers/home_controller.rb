class HomeController < ApplicationController
  def index
    @listings = Listing.order(id: :desc)
  end
end
