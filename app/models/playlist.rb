class Playlist < ActiveRecord::Base
  belongs_to      :user
  has_many        :bookmarks
  has_many        :playlist_selections
  has_many        :songs
end
