class Song < ApplicationRecord
  before_destroy :delete_associated_playlist_songs

  belongs_to :show

  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  validates :title, presence: true

  private

  def delete_associated_playlist_songs
    playlist_songs.each(&:destroy)
  end
end
