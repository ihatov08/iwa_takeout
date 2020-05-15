# == Schema Information
#
# Table name: foods
#
#  id         :bigint           not null, primary key
#  image_url  :text
#  main_image :string           not null
#  name       :string           not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :bigint           not null
#
# Indexes
#
#  index_foods_on_listing_id  (listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#
class Food < ApplicationRecord
  belongs_to :listing

  mount_uploader :main_image, ImageUploader

  with_options presence: true do
    validates :main_image
    validates :name
    validates :price
  end

  def image_url_or_main_image
    if image_url?
      image_url
    else
      main_image.url
    end
  end
end
