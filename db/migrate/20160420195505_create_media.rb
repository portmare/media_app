class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :link
      t.references :album, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
