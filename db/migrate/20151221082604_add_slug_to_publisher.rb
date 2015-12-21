class AddSlugToPublisher < ActiveRecord::Migration
  def change
    add_column :publishers, :slug, :string
  end
end
