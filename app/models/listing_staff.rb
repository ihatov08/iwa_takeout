class ListingStaff < ApplicationRecord
  belongs_to :listing
  belongs_to :client_staff
end
