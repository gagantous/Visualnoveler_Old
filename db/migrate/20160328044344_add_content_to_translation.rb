class AddContentToTranslation < ActiveRecord::Migration
  def change
    add_column :translations, :content, :text
  end
end
