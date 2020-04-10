class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  def index
    @listings = Listing.order(id: :desc)
    render "home/index"
  end

  def show
  end

  def new
    @listing = Listing.new
    render :layout => 'listing'
  end

  def edit
    render :layout => 'listing'
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to :root, notice: "店舗情報ありがとうございます！"
    else
      flash.now[:alert] = "必須情報を入力してください"
      render :new, layout: "listing"
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(
      :name,
      :tel,
      :description,
      :postal_code,
      :address,
      :open_at,
      :close_at,
      :free_text,
      :image,
      holiday_ids: [],
    )
  end
end
