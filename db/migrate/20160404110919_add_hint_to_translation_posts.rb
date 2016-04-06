class AddHintToTranslationPosts < ActiveRecord::Migration
  def change
    add_column :translation_posts, :actual_vn_name, :string
  end
end
