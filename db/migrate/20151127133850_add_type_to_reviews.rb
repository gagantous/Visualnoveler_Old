class AddTypeToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :status, :integer
  end
end
