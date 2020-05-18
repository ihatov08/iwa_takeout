# == Schema Information
#
# Table name: menus
#
#  id         :bigint           not null, primary key
#  image      :string           not null
#  image_url  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :bigint           not null
#
# Indexes
#
#  index_menus_on_listing_id  (listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#
class Menu < ApplicationRecord
  belongs_to :listing

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :image
  end

  def image_url_or_image
    if image?
      image.url
    elsif image_sub_uri?
      image_sub_uri
    else
      image.url
    end
  end
end
