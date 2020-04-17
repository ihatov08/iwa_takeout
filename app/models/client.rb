class Client < ApplicationRecord
  has_many :listings, dependent: :destroy

  validates :name, presence: true
end
