class AddWalkthroughContentToVn < ActiveRecord::Migration
  def change
    add_column :vns, :walkthrough_content, :text
  end
end
