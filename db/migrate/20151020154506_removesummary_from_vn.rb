class RemovesummaryFromVn < ActiveRecord::Migration
  def up

    remove_column :vn, :summary
  end
end
