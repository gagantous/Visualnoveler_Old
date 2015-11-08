class AddGenreIdToVns < ActiveRecord::Migration
  def change
    add_reference :vns, :genre, index: true, foreign_key: true
  end
end
