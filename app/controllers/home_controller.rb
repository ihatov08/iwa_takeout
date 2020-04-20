class HomeController < ApplicationController
  def index
    @q = Listing.published.ransack(params[:q])
    @foods = Food.joins(:listing).where("listings.published = ?", true).order(id: :desc)
    @menus = Menu.joins(:listing).where("listings.published = ?", true).order(id: :desc)
    @listings = Listing.page(params[:page])

    if params[:page]
      redirect_to listings_path(page: params[:page])
    end
  end
end
