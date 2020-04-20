class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :prefecture
  belongs_to :city

  with_options presence: true do
    validates :address
    validates :title
  end

  mount_uploader :main_image, ImageUploader

  has_many :listing_staffs
  has_many :client_staffs, through: :listing_staffs

  has_many :foods, dependent: :destroy
  accepts_nested_attributes_for :foods, allow_destroy: true

  has_many :menus, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true

  has_rich_text :content

  scope :published, -> { where(published: true) }

  def full_address
    "#{prefecture.name} #{city.name} #{address}"
  end

  def self.engan_exclude
    %w(大槌 釜石 大船渡 陸前高田 山田)
  end
end
