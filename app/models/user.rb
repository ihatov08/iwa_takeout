class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :trackable,
         :omniauthable, omniauth_providers: %i[facebook]

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, uniqueness: true

  has_many :listings, dependent: :destroy

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0, 20]
     user.name = auth.info.name
     user.remote_avatar_url = auth.info.image
     user.skip_confirmation!
   end
  end
end
