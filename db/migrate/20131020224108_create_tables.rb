class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps
    end
    create_table :restaurants do |t|
      t.string :camis, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.date :date, null: false
      t.string :points, null: false
      t.string :grade
      t.float :long, null: false
      t.float :lat, null: false
      t.timestamps
    end
    create_table :restaurants_users do |t|
      t.belongs_to :user, null: false
      t.belongs_to :restaurant, null: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE restaurants_users
          ADD CONSTRAINT fk_users
          FOREIGN KEY (user_id)
          REFERENCES users(id),
          ADD CONSTRAINT fk_restaurants
          FOREIGN KEY (restaurant_id)
          REFERENCES restaurants(id)
        SQL
      end
    end
  end
end
