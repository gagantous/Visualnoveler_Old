class AddReadyToBracket < ActiveRecord::Migration
  def change
    add_column :brackets, :ready, :boolean
  end
end
