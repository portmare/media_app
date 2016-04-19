class CreateTokenKeys < ActiveRecord::Migration
  def change
    create_table :token_keys do |t|
      t.string :token, null: false, unique: true
      t.integer :access, default: 0, null: false
      t.references :tokenable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
