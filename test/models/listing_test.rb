# == Schema Information
#
# Table name: listings
#
#  id                     :bigint           not null, primary key
#  address                :string           not null
#  description            :text
#  google_map_url         :string
#  holidays               :string
#  hours                  :string
#  image_url              :text
#  main_image             :string
#  postal_code            :string
#  published              :boolean          default(FALSE), not null
#  suspension_information :string
#  tabelog_url            :string
#  tel                    :string
#  title                  :string           not null
#  website_url            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  category_id            :bigint           not null
#  city_id                :bigint           not null
#  facebook_id            :string
#  google_my_map_id       :bigint
#  instagram_id           :string
#  prefecture_id          :bigint           not null
#  twitter_id             :string
#
# Indexes
#
#  index_listings_on_category_id       (category_id)
#  index_listings_on_city_id           (city_id)
#  index_listings_on_google_my_map_id  (google_my_map_id)
#  index_listings_on_prefecture_id     (prefecture_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (google_my_map_id => google_my_maps.id)
#  fk_rails_...  (prefecture_id => prefectures.id)
#
require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
