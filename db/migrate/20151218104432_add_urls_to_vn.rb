class AddUrlsToVn < ActiveRecord::Migration
  def change
    add_column :vns, :buy_1, :string
    add_column :vns, :buy_2, :string
    add_column :vns, :buy_3, :string
    add_column :vns, :buy_4, :string
  end
end
