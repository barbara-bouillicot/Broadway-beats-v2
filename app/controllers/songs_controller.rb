class SongsController < ApplicationController
  def index

  end

  def show
    @song = Song.find(params[:id])
  end

  def create
    @playlist_song = PlaylistSong.new
    @song = Song.new(params_song)
    if @song.save
      render "songs/_playlist_song_modal"
    else
      render json: { errors: @playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def params_song
    params.require(:song).permit(:show_id, :title, :image_url, :track_id, artists:[])
  end
end
