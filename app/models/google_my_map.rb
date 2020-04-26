# == Schema Information
#
# Table name: google_my_maps
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  url        :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GoogleMyMap < ApplicationRecord
end
