class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.string :title
      t.string :link
      t.integer :reply_count
      t.datetime :date_time

      t.timestamps null: false
    end
  end
end
