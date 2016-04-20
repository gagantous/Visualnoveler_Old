class ChangePendingToTranslationPosts < ActiveRecord::Migration
	def up
  		change_column :translation_posts, :pending, :boolean, :default => false
	end

	def down
	  	change_column :translation_posts, :pending, :boolean, :default => nil
	end
end
