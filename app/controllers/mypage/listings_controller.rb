class Mypage::ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: %i[show edit update destroy]

  def index
    @listings = current_user.listings
  end

  def show
    render "listings/show"
  end

  def new
    @listing = current_user.listings.build
  end

  def edit
  end

  def create
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to [:mypage, @listing], notice: "リスティングの作成に成功しました"
    else
      flash.now[:alert] = "リスティングの作成に失敗しました"
      render :new
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to [:mypage, @listing], notice: "リスティングの更新に成功しました"
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
      :description,
      :price,
      :main_image,
      :main_image_cache,
      gallery_images_attributes: %i[image_cache id image order _destroy]
    )
  end

  def set_listing
    @listing = current_user.listings.find(params[:id])
  end
end
