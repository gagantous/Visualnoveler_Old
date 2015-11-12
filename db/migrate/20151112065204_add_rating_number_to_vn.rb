class AddRatingNumberToVn < ActiveRecord::Migration
  def change
    add_column :vns, :rating_number, :float
  end
end
