class PlaylistSelection < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :song

  validates :song, :presence => :true
  validates :playlist, :presence => :true
end
