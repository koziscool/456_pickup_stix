module PlaylistsHelper

  def user_has_bookmarked_playlist(user,playlist)
    if playlist.bookmarks.where("user_id = ?", user.id).empty?
      false 
    else
      playlist.bookmarks.where("user_id = ?", user.id)[0]
    end
  end
end
