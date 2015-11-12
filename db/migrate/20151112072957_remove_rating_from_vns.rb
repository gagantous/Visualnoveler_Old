class RemoveRatingFromVns < ActiveRecord::Migration
  def change
    remove_column :vns, :rating, :string
  end
end
