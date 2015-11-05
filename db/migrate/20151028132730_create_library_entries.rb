class CreateLibraryEntries < ActiveRecord::Migration
  def change
    create_table :library_entries do |t|
      t.integer :rating
      t.string :status
      t.references :vn, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
