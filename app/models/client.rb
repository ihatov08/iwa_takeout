class Client < ApplicationRecord
  has_many :listings, dependent: :destroy
end
