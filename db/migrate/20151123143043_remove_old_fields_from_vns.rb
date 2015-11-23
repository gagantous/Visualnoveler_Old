class RemoveOldFieldsFromVns < ActiveRecord::Migration
  def change
    remove_column :vns, :genre_old, :string
    remove_column :vns, :developer_old, :string
  end
end
