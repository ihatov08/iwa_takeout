class HomeController < ApplicationController
  def index
    @q = Listing.published.ransack(params[:q])
    @foods = Food.joins(:listing).where("listings.published = ?", true).order(id: :desc)
    @menus = Menu.joins(:listing).where("listings.published = ?", true).order(id: :desc)
  end
end
