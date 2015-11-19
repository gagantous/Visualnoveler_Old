class AddSlugToItems < ActiveRecord::Migration
  def change
    add_column :developers, :slug, :string, unique: true
    add_column :genres, :slug, :string, unique: true
    add_column :vns, :slug, :string, unique: true
  end
end
