class User < ActiveRecord::Base

  before_create :generate_token
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  validates :password, :length => { :in => 5..35 }, :allow_nil => true


  has_many  :playlists, :dependent => :destroy
  has_many  :bookmarks, :dependent => :destroy
  
  has_many :initiated_followings, class_name: "Following", foreign_key: :follower_id
  has_many :followeds, through: :initiated_followings, source: :followed

  has_many :received_followings, class_name: "Following", foreign_key: :followed_id
  has_many :followers, through: :received_followings, source: :follower


  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end


  def name
    first_name + " " + last_name
  end

  def name_and_count
    "#{first_name} #{last_name}(#{playlists.count})"
  end

end
