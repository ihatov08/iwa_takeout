class GalleryImage < ApplicationRecord
  belongs_to :listing

  with_options presence: true do
    validates :image
    validates :order
  end
end
