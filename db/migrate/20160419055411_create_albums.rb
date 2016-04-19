class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.string :token, index: true, unique: true, null: false
      t.integer :access, default: 0, null: false

      t.timestamps null: false
    end
  end
end
