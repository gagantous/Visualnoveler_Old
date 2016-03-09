class RemoveUselessFieldsToVns < ActiveRecord::Migration
  def change
  	remove_column :library_entries,:name
  	remove_column :vns, :route_url
  end
end
