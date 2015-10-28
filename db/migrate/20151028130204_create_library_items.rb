class CreateLibraryItems < ActiveRecord::Migration
  def change
    create_table :library_items do |t|
      t.belongs_to :Vn, index: true
      t.belongs_to :User, index: true

      t.timestamps null: false
    end
  end
end
