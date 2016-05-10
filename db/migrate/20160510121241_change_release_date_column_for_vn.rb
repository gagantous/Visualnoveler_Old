class ChangeReleaseDateColumnForVn < ActiveRecord::Migration
  def change
    add_column :vns, :release_date1,:date
    Vn.find_each do |vn|
    	date = vn.release_date
    	vn.update_attribute(:release_date1,date)
  	end
  	remove_column :vns, :release_date
  	rename_column :vns, :release_date1,:release_date
  end

end
