class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  belongs_to :city
end
