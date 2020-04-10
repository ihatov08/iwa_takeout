class ListingHoliday < ApplicationRecord
  belongs_to :listing
  belongs_to :day_of_week
end
