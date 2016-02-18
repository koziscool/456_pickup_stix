class PlaylistsController < ApplicationController
  
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end


  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      flash[:success] = "playlist created"
      redirect_to playlist_path(@playlist)
    else
      flash[:error] = "playlist not created"
      render :new
    end
  end


  def show
    @playlist = Playlist.find(params[:id])
  end


  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    if  @playlist.update( playlist_params )
      flash[:success] = "playlist updated"
      redirect_to playlist_path(@playlist)
    else
      flash[:error] = "playlist not updated"
      render :edit
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    if @playlist.destroy
      flash[:success] = "playlist deleted"
    else
      flash[:error] = "playlist not deleted"
    end
    redirect_to current_user
  end

private
  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
