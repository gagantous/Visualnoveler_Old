class AddIndexToCharacters < ActiveRecord::Migration
  def change
  	
  	add_index "characters", ["vn_id"], name: "index_characters_on_vn_id"
  end
end
