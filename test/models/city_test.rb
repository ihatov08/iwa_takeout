# == Schema Information
#
# Table name: cities
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  name_en       :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :bigint           not null
#
# Indexes
#
#  index_cities_on_prefecture_id                       (prefecture_id)
#  index_cities_on_prefecture_id_and_name_and_name_en  (prefecture_id,name,name_en) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (prefecture_id => prefectures.id)
#
require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
