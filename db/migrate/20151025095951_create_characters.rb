class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :summary
      t.string :voiceactor
      t.integer :vn_id
      t.string :vn_name
      t.string :img_string

      t.timestamps null: false
    end
  end
end
