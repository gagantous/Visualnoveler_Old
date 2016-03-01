class CreateNewsImages < ActiveRecord::Migration
  def change
    create_table :news_images do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
