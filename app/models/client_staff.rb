# == Schema Information
#
# Table name: client_staffs
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_client_staffs_on_confirmation_token    (confirmation_token) UNIQUE
#  index_client_staffs_on_email                 (email) UNIQUE
#  index_client_staffs_on_reset_password_token  (reset_password_token) UNIQUE
#  index_client_staffs_on_unlock_token          (unlock_token) UNIQUE
#
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
