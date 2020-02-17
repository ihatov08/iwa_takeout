class ListingsController < ApplicationController
  def index
    @q = Listing.published.ransack(params[:q])
    @listings = @q.result(distinct: true).page(params[:page])
  end

  def show
    @listing = Listing.published.find(params[:id])
  end
end
