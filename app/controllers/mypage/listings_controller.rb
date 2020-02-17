class Mypage::ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = current_user.listings
  end

  def show
  end

  def new
    @listing = current_user.listings.build
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
