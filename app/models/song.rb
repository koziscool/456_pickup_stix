class Song < ActiveRecord::Base

  belongs_to    :artist
  has_many      :bookmarks
  has_many      :playlist_selections
  has_many      :playlists
end
