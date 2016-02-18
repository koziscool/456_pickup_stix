class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new( bookmark_params )
    if @bookmark.save
      flash[:success] = "created bookmark"
    else
      flash[:error] = "did not create bookmark"
    end
    redirect_to :back
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:success] = "destroyed bookmark"
    else
      flash[:error] = "did not destroy bookmark"
    end
    redirect_to :back
  end

  def bookmark_params
    params.permit(:user_id, :bookmarkable_type, :bookmarkable_id )
  end

end
