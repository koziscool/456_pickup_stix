class FollowingsController < ApplicationController

  def index
      if Following.where("follower_id = ? AND followed_id = ?", 
          current_user.id, params[:followed_id] ).empty?
        @following = Following.new
        @following.follower_id = current_user.id
        @following.followed_id = params[:followed_id]
        @following.save
      end
      redirect_to :back
  end

  def destroy
      @following = Following.where("follower_id = ? AND followed_id = ?", 
          current_user.id, params[:followed_id] )
      unless @following.empty? 
        @following[0].destroy
      end
      redirect_to :back
  end

end
