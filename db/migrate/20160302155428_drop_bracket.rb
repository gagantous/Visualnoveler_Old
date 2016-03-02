class DropBracket < ActiveRecord::Migration
  def up
    drop_table :brackets
    drop_table :bracket_characters
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
