class ListingsController < ApplicationController
  def index
    @listings = Listing.published
  end
end
