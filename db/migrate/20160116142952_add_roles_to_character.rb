class AddRolesToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :role, :integer,default: 0
  end
end
