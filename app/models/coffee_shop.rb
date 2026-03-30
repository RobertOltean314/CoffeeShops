class CoffeeShop < ApplicationRecord
  validates :name, :address, :x_coordinate, :y_coordinate, :closing_time, presence: true

  def calculate_distance(x, y)
    Math.sqrt((x - x_coordinate) **2 + (y - y_coordinate) **2)
  end
end
