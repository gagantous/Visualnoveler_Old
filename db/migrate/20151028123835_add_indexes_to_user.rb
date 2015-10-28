class AddIndexesToUser < ActiveRecord::Migration
  def change
    add_column :users, :poster_image, :string
    add_column :users, :name, :string
  end
end
