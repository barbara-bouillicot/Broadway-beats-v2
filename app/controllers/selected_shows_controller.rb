class SelectedShowsController < ApplicationController
  def index
    @selected_shows = SelectedShow.all
  end

  def show
    @selected_show = SelectedShow.find(params[:id])
    @songs = @selected_show.show.songs
    @albums = RSpotify::Album.search(@selected_show.show.title).first(1)
    @playlist_song = PlaylistSong.new
    @playlist = Playlist.new
  end

  def create
    @selected_show = SelectedShow.new(params_selected_show)
    if @selected_show.save
      redirect_to selected_shows_path, notice: 'This show was successfully added to your faves.'
    else
      render json: { errors: @selected_show.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @selected_show = SelectedShow.find(params[:id])
    @selected_show.destroy
    redirect_to selected_shows_path, notice: "Show successfully removed from your faves!"
  end

  private

  def params_selected_show
    params.require(:selected_show).permit(:user_id, :show_id)
  end

end
