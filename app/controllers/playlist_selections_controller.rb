class PlaylistSelectionsController < ApplicationController

  before_action :require_login

  def create
    @playlist_selection = PlaylistSelection.new( selection_params )
    if @playlist_selection.save
      flash[:success] = "created playlist selection!"
    else
      flash[:error] = "did not create selection"
    end
    redirect_to :back
  end

  def destroy
    @playlist_selection = PlaylistSelection.find(params[:id])
    if @playlist_selection.destroy
      flash[:success] = "destroyed playlist selection!"
    else
      flash[:error] = "did not destroy selection"
    end
    redirect_to :back
  end

  private
  def selection_params
    params.require(:playlist_selection).permit(:playlist_id, :song_id)
  end
end
