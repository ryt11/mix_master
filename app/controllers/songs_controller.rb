class SongsController < ApplicationController

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def index
    @songs = Artist.find(params[:artist_id]).songs
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)

    redirect_to song_path(@song)
  end

  def destroy
    @song = Song.find(params[:id])
    Song.destroy(params[:id])
    redirect_to artist_songs_path(@song.artist)
  end

  def show
    @song = Song.find(params[:id])
  end


  private

  def song_params
    params.require(:song).permit(:title)
  end
end
