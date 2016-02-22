class PlaylistSelectionsController < ApplicationController

  before_action :require_current_user


  def create
    @playlist_selection = PlaylistSelection.new( playlist_selection_params )
    if @playlist_selection.save
      flash[:success] = "added to playlist successfully!"
      redirect_to root_path
    else
      if !signed_in_user?
         flash[:error] = "not added successfully!"
         render :new
      else
        flash[:error] = "not added successfully!"
        redirect_to root_url
      end   
    end

  end

  def destroy

    # also a hack, maybe a better way to do this
    if params[:id].to_i == 0
      @playlist_selection = nil
    else
      @playlist_selection = PlaylistSelection.find(params[:id])
    end

    if @playlist_selection && @playlist_selection.destroy
      flash[:success] = "selection removed!"
      redirect_to root_url
    else    
      flash[:error] = "selection not removed!"
      redirect_to root_url
    end
  end
  

  def playlist_selection_params
     params.require(:playlist_selection).permit( :song_id, :playlist_id )
  end

end
