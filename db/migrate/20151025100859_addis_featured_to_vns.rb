class AddisFeaturedToVns < ActiveRecord::Migration
  def change
  	add_column :vns, :isFeatured, :boolean
  end
end
