class Listing < ApplicationRecord
  has_many :listing_holidays
  has_many :holidays, through: :listing_holidays, source: "day_of_week"

  def holiday_names
    holidays.pluck(:name).join(",")
  end
end
