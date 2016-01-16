class AddNotesToLibraryEntries < ActiveRecord::Migration
  def change
    add_column :library_entries, :notes, :text
  end
end
