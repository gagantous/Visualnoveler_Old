class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :name
      t.string :image
      t.references :vn, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
