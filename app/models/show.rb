class Show < ApplicationRecord
  has_many :songs
  has_many :reviews
  has_many :selected_shows, dependent: :destroy
  has_many :users, through: :selected_shows

  validates :title, :description, :image_url, presence: true
end
