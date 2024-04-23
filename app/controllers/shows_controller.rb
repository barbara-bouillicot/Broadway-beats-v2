class ShowsController < ApplicationController

  def show
    @show = Show.find(params[:id])
  end

  def index
    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])

    if params[:search].present?
      query = params[:search].capitalize
      @shows = Show.where("title LIKE ?", "%#{query}%")
    else
      @shows = Show.all
    end
  end
end
