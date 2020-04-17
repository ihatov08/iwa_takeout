class ClientStaff < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :trackable

  has_many :listing_staffs
  has_many :listings, through: :listing_staffs
end
