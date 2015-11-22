class RemoveAltFromScreenshots < ActiveRecord::Migration
  def change
    remove_column :screenshots, :alt, :string
  end
end
