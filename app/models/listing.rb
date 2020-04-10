class Listing < ApplicationRecord
  has_many :listing_holidays
  has_many :holidays, through: :listing_holidays, source: "day_of_week"

  has_rich_text :free_text
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :address
  end

  def holiday_names
    holidays.pluck(:name).join(",")
  end
end
