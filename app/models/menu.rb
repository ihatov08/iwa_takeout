class Menu < ApplicationRecord
  belongs_to :listing

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :image
  end
end
