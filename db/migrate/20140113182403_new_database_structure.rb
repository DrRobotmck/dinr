class NewDatabaseStructure < ActiveRecord::Migration
  def change
  	drop_table :restaurants_users
  	drop_table :restaurants

  	create_table :restaurants do |r|
  		r.string :camis, null: false
  		r.string :name, null: false
  		r.string :building, null: false
  		r.string :street, null: false
  		r.string :zip, null: false
  		r.string :phone
  		r.string :cuisine, null: false
  		r.date :inspected, null: false
  		r.string :action
  		r.string :violation
  		r.string :score
  		r.string :grade
  		r.string :grade_date
  		r.timestamps
  	end
  	create_table :restaurants_users do |t|
      t.belongs_to :user, null: false
      t.belongs_to :restaurant, null: false
      t.timestamps
    end

  end
end
