class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.references :vn, index: true, foreign_key: true
      t.string :website
      t.float :progress

      t.timestamps null: false
    end
  end
end
