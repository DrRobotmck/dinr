class AddColumnsLatLong < ActiveRecord::Migration
  def change
  	add_column :restaurants, :lat, :float, {:precision=>10, :scale=>6}
  	add_column :restaurants, :long, :float, {:precision=>10, :scale=>6}
  end
end
