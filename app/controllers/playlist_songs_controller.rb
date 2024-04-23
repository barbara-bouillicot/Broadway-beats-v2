class PlaylistSongsController < ApplicationController
  def create
    @playlist_song = PlaylistSong.new(params_playlist_song)
    if @playlist_song.save
      redirect_to playlist_path(@playlist_song.playlist)
    else
      render json: { errors: @playlist_song.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def params_playlist_song
    params.require(:playlist_song).permit(:song_id, :playlist_id)
  end
end
