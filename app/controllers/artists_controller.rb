class ArtistsController < ApplicationController
  before_action :set_billboard
  before_action :set_artist, only: [:show, :edit, :update, :destroy, :index]
 
  
  def index
    @artists = @billboard.artists
  end

  def show

  end

  def new
    @artist = @billboard.artists.new
    render partial: "form"
  end

  
  def create
    @artist = @billboard.artists.new(artist_params)
    
    if @artist.save
      redirect_to [@billboard, @artist]
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @artist.update(artist_params)
      redirect_to [@billboard, @artist]
    else
      render :edit
    end

  end

  def destroy
    @artist.destroy
    redirect_to billboard_artists_path
   
  end


 private
  def set_billboard
    @billboard = Billboard.find(params[:billboard_id])
  end

  def set_artist
   @artist = Artist.find_by_id(params[:id])
  end
  

  def artist_params
   params.require(:artist).permit(:name, :genre, :bio)
  end


end

