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
    @listing = current_user.listings.build(listing_params)

    if @listing.save
      redirect_to [:mypage, @listing], notice: "リスティングの作成に成功しました"
    else
      flash.now[:alert] = "リスティングの作成に失敗しました"
      render :new
    end
  end

  def update
  end

  def destroy
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
end
