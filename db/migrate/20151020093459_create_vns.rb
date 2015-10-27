class CreateVns < ActiveRecord::Migration
  def change
    create_table :vns do |t|
      t.string :name
      t.text :summary
      t.string :genre
      t.string :developer
      t.string :rating
      t.timestamps null: false
    end
  end
end
