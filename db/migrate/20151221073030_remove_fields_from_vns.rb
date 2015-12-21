class RemoveFieldsFromVns < ActiveRecord::Migration
  def change
    add_column :vns, :alias, :string
    remove_column :vns, :genre_id, :integer
  end
end
