class ChangeDeveloperColumn < ActiveRecord::Migration
  def change
    rename_column :vns, :developer, :developer_old
  end
end
