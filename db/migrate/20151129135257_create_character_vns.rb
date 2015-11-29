class CreateCharacterVns < ActiveRecord::Migration
  def change
    create_table :character_vns do |t|
      t.references :vn, index: true, foreign_key: true
      t.references :character, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
