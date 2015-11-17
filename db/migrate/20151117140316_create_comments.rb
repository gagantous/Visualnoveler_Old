class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :detail
      t.integer :post_author_id
      t.integer :wall_author_id

      t.timestamps null: false
    end
  end
end
