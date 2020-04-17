class Listing < ApplicationRecord
  belongs_to :client
  belongs_to :category
  belongs_to :prefecture
  belongs_to :city

  with_options presence: true do
    validates :postal_code
    validates :address
    validates :title
    validates :description
  end

  mount_uploader :main_image, ImageUploader

  has_many :foods, dependent: :destroy
  accepts_nested_attributes_for :foods, allow_destroy: true

  scope :published, -> { where(published: true) }

  def full_address
    "#{prefecture.name} #{city.name} #{address}"
  end
end
