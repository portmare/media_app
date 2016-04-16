class AddPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :crypted_password, :string
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string

    add_index :users, :email, unique: true

    remove_column :users, :password_digest, :string
  end
end
