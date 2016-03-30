class CreateTranslationPosts < ActiveRecord::Migration
  def change
    create_table :translation_posts do |t|
      t.text :post
      t.references :vn, index: true, foreign_key: true
      t.references :translation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
