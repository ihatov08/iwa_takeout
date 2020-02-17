class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  belongs_to :city

  with_options presence: true do
    validates :postal_code
    validates :address
    validates :title
    validates :description
    validates :price
  end

  mount_uploader :main_image, ImageUploader

  has_many :gallery_images, dependent: :destroy
  accepts_nested_attributes_for :gallery_images, allow_destroy: true

  def full_address
    "#{prefecture.name} #{city.name} #{address}"
  end
end
