class CreateVnGenres < ActiveRecord::Migration
  def change
    create_table :vn_genres do |t|
      t.references :vn, index: true, foreign_key: true
      t.references :genre, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
