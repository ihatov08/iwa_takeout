class Mypage::ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  def index
    @listings = current_client_staff.listings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to :root, notice: "お店情報提供ありがとうございました！"
    else
      flash.now[:alert] = "お店情報の保存に失敗しました"
      render :new
    end
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
      :remove_main_image,
      :published,
      :content,
      :image_url,
      :tabelog_url,
      :facebook_url,
      :twitter_url,
      :instagram_url,
      :suspension_information,
      foods_attributes: %i[main_image_cache id name main_image price _destroy],
      menus_attributes: %i[image_cache id image _destroy]
    )
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
