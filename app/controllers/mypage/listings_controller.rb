class Mypage::ListingsController < ApplicationController
  before_action :authenticate_client_staff!
  before_action :set_listing, only: %i[show edit update destroy]

  def index
    @listings = current_client_staff.listings
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "リスティングの更新に成功しました"
    else
      flash.now[:alert] = "リスティングの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to mypage_listings_path, notice: "リスティングの削除に成功しました"
  end

  private

  def listing_params
    params.require(:listing).permit(
      :category_id,
      :postal_code,
      :prefecture_id,
      :city_id,
      :address,
      :title,
      :hours,
      :holidays,
      :tel,
      :website_url,
      :description,
      :main_image,
      :main_image_cache,
      :published,
      foods_attributes: %i[main_image_cache id name main_image price _destroy]
    )
  end

  def set_listing
    @listing = current_client_staff.listings.find(params[:id])
  end
end
