class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :auth_token, :string
    add_index :users, :auth_token, :unique => true
  end
end
