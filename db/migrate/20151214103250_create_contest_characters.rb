class CreateContestCharacters < ActiveRecord::Migration
  def change
    create_table :contest_characters do |t|
      t.references :contest
      t.references :character

      t.timestamps null: false
    end
  end
end
