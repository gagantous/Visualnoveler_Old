class CreateVnPublishers < ActiveRecord::Migration
  def change
    create_table :vn_publishers do |t|
      t.references :vn, index: true, foreign_key: true
      t.references :publisher, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
