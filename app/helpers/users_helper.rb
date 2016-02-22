module UsersHelper
  def get_mark_show_path( mark )
    if mark.bookmarkable_type == "Artist"
      the_path = artist_path( Artist.find( mark.bookmarkable_id ) )
    end
    if mark.bookmarkable_type == "Playlist"
      the_path = playlist_path( Playlist.find( mark.bookmarkable_id ) )
    end
    if mark.bookmarkable_type == "Song"
      the_path = song_path( Song.find( mark.bookmarkable_id ) )
    end
    the_path
  end

  def following_exists?( user1, user2 )
    Following.where("follower_id = ? AND followed_id = ?", 
          current_user.id, params[:followed_id] ).empty?
  end


end
