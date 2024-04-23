class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :playlists
  has_many :selected_shows
  has_many :shows, through: :selected_shows

  validates :first_name, :last_name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.first_name = auth.info['first_name'] || 'DefaultFirstName'
      user.last_name = auth.info['last_name'] || 'DefaultLastName'
      user.email = auth.info['email'] || 'example@example.com'
      user.password = Devise.friendly_token[0, 20]
    end.tap do |user|
      user.save! if user.persisted?
    end
  end
end
