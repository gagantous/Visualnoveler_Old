class AddImagesToVns < ActiveRecord::Migration
  def change

    add_column :vns, :release_date, :string
    add_column :vns, :image_poster, :string
    add_column :vns, :image_coverpage, :string
    add_column :vns, :image_1, :string
    add_column :vns, :image_2, :string
    add_column :vns, :image_3, :string
    add_column :vns, :image_4, :string
  end
end
