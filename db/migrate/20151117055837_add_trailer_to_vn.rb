class AddTrailerToVn < ActiveRecord::Migration
  def change
    add_column :vns, :trailer_url, :string
  end
end
