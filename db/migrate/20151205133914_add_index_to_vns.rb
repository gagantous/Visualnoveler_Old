class AddIndexToVns < ActiveRecord::Migration
  def change
    add_reference :vns, :franchise, index: true, foreign_key: true
  end
end
