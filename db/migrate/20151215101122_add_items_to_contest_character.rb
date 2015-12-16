class AddItemsToContestCharacter < ActiveRecord::Migration
  def change
    add_column :contest_characters, :name, :string
    add_column :contest_characters, :image, :string
    add_column :contest_characters, :details, :text
  end
end
