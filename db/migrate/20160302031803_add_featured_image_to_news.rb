class AddFeaturedImageToNews < ActiveRecord::Migration
  def change
    add_column :news, :featured_image, :string
  end
end
