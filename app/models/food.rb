class Food < ApplicationRecord
  belongs_to :listing

  mount_uploader :main_image, ImageUploader

  with_options presence: true do
    validates :main_image
    validates :name
    validates :price
  end
end
