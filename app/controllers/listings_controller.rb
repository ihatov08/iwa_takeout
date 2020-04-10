class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show]

  def index
  end

  def show
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
