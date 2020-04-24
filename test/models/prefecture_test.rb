# == Schema Information
#
# Table name: prefectures
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  name_en    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_prefectures_on_name     (name) UNIQUE
#  index_prefectures_on_name_en  (name_en) UNIQUE
#
require 'test_helper'

class PrefectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
