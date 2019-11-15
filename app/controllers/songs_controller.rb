class SongsController < ApplicationController
  before_action :set_artist
  
  def index
    
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = @artist.songs.new(songs_params)
    if @song.save
      redirect_to billboard_artist_path(@artist.billboard_id, @artist)
    else
      render :new
    end
  end

  def edit
  end

  private
  def set_artist
    @artist = Billboard.find(params[:artist_id])
end


