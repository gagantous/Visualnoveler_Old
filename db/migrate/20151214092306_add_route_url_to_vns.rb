class AddRouteUrlToVns < ActiveRecord::Migration
  def change
    add_column :vns, :route_url, :string
  end
end
