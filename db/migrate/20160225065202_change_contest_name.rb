class ChangeContestName < ActiveRecord::Migration
  def change
  	rename_table :contests, :brackets
  	rename_table :contest_characters, :bracket_characters
  end
end
