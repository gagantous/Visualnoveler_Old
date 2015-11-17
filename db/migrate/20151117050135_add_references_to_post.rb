class AddReferencesToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :vn, index: true, foreign_key: true
  end
end
