class AlterRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :boro, :string, null: false 
  end
end
