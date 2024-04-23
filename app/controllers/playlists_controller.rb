class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
    @playlist = Playlist.new
  end

  def show
    @playlist = Playlist.find(params[:id])
    @playlist_songs = PlaylistSong.where(playlist_id: @playlist.id)
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(params_playlist)
    if @playlist.save
      redirect_to playlist_path(@playlist), notice: 'New Playlist created.'
    else
      render json: { errors: @playlist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to playlists_path, notice: "Playlist successfully deleted!"
  end

  private

  def params_playlist
    params.require(:playlist).permit(:user_id, :name)
  end
end
