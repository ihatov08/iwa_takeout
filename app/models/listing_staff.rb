# == Schema Information
#
# Table name: listing_staffs
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  client_staff_id :bigint           not null
#  listing_id      :bigint           not null
#
# Indexes
#
#  index_listing_staffs_on_client_staff_id  (client_staff_id)
#  index_listing_staffs_on_listing_id       (listing_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_staff_id => client_staffs.id)
#  fk_rails_...  (listing_id => listings.id)
#
class ListingStaff < ApplicationRecord
  belongs_to :listing
  belongs_to :client_staff
end
