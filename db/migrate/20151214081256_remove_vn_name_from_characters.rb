class RemoveVnNameFromCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :vn_name, :string
  end
end
