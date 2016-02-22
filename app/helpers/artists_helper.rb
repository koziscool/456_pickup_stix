module ArtistsHelper
  def user_has_bookmarked_artist(user,artist)
    if artist.bookmarks.where("user_id = ?", user.id).empty?
      false 
    else
      artist.bookmarks.where("user_id = ?", user.id)[0]
    end
  end
end
