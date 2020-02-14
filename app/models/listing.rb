class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  belongs_to :city

  with_options presence: true do
    validates :postal_code
    validates :address
    validates :title
    validates :description
    validates :price
  end
end
