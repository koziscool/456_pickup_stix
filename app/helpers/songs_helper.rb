module SongsHelper
  def user_has_bookmarked_song(user,song)
    if song.bookmarks.where("user_id = ?", user.id).empty?
      false 
    else
      song.bookmarks.where("user_id = ?", user.id)[0]
    end
  end
end
