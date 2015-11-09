class AddNametoLibraryEntry < ActiveRecord::Migration
  def change

    add_column :library_entries, :name, :string
  end
end
