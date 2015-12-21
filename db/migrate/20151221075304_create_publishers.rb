class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.text :details
      t.references :vn, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
