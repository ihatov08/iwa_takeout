class GalleryImage < ApplicationRecord
  belongs_to :listing

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :image
    validates :order
  end
end
