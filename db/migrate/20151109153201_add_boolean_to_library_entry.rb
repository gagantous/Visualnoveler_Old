class AddBooleanToLibraryEntry < ActiveRecord::Migration
  def change
    add_column :library_entries, :favourite, :boolean
  end
end
