class RemoveTokenFromAlbum < ActiveRecord::Migration
  def change
    remove_column :albums, :access, :integer
    remove_column :albums, :token, :string
  end
end
