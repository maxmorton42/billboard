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
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to billboard_artists_path(@artist.billboard_id, @artist)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end 

  private  

  def set_artist
    @artist = Artist.find_by_id(params[:artist_id])
  end

  def song_params
   params.require(:song).permit(:name)
  end
end


