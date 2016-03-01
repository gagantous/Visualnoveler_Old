class AddReferenceToNewsImages < ActiveRecord::Migration
  def change
    add_reference :news_images, :news, index: true, foreign_key: true
  end
end
