# == Schema Information
#
# Table name: menus
#
#  id         :bigint           not null, primary key
#  image      :string           not null
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
require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
