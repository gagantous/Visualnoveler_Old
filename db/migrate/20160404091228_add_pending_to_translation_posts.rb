class AddPendingToTranslationPosts < ActiveRecord::Migration
  def change
    add_column :translation_posts, :pending, :boolean
    add_column :translation_posts, :pending_vn_names, :text
  end
end
