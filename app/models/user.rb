class User < ActiveRecord::Base

 has_secure_password

  validates :password, :length => { :in => 5..35 }, :allow_nil => true
end

