class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :vn, index: true, foreign_key: true
      t.text :details
      t.integer :rating

      t.timestamps null: false
    end
  end
end
