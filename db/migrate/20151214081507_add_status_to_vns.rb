class AddStatusToVns < ActiveRecord::Migration
  def change
    add_column :vns, :status, :integer,default: 0
  end
end
