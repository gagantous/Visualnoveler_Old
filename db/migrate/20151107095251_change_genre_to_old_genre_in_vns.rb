class ChangeGenreToOldGenreInVns < ActiveRecord::Migration
  def change

     rename_column :vns, :genre, :genre_old
  end
end
