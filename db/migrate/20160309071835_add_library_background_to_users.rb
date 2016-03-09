class AddLibraryBackgroundToUsers < ActiveRecord::Migration
  def change
    add_column :users, :library_image, :string
    add_column :users, :library_image_type, :string
  end
end
