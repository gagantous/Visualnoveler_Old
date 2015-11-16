class AddIndexToVn < ActiveRecord::Migration
  def change
    add_reference :vns, :developer, index: true, foreign_key: true
  end
end
