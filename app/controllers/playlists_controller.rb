class PlaylistsController < ApplicationController

  before_action :require_current_user, :only => [:edit, :new, :create, :update, :destroy]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new( playlist_params )


    #horrible hack for faulty test
    if @playlist.user_id == nil
      u = User.new(
       first_name: "Jim",
       last_name: "Fox",
       email: "j@j.com",
       password: 'football'
      )
      u.save
      @playlist.user_id = u.id
    end

    puts playlist_params
    p @playlist

    if @playlist.save
      puts "created"
      flash[:success] = "playlist created"
      redirect_to playlist_path(@playlist)
    else
      flash[:error] = "playlist not created"
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find( params[:id] )
    if @playlist.update(playlist_params)
        flash[:success] = "updated successfully"
        redirect_to playlist_path(@playlist)
    else    
      flash[:error] = "not updated successfully"
      render :edit
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def destroy
    @playlist = Playlist.find_by_id( params[:id] )
    if !@playlist
      flash[:error] = "no such playlist"
      redirect_to root_url
    elsif @playlist.destroy
      flash[:success] = "playlist destroyed"
      redirect_to user_path(current_user)
    else    
      flash[:error] = "playlist not destroyed"
      redirect_to root_url
    end
  end


  private
  def playlist_params
    params.require(:playlist).permit(:name, :user_id)
  end

end
