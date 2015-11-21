class AddAltToScreenshots < ActiveRecord::Migration
  def change
    add_column :screenshots, :alt, :string
  end
end
