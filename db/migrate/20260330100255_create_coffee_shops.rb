class CreateCoffeeShops < ActiveRecord::Migration[8.1]
  def change
    create_table :coffee_shops do |t|
      t.string :name
      t.string :address
      t.float :x_coordinate
      t.float :y_coordinate
      t.datetime :closing_time

      t.timestamps
    end
  end
end
