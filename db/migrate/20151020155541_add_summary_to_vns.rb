class AddSummaryToVns < ActiveRecord::Migration
  def change
    add_column :vns, :summary, :text
  end
end
