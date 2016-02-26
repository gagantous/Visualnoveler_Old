class ChangeContestIdBracketCharacters < ActiveRecord::Migration
  def change
  	rename_column :bracket_characters, :contest_id, :bracket_id
  end
end
