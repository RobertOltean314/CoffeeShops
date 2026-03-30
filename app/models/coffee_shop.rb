class CoffeeShop < ApplicationRecord
  validates :name, :address, :x_coordinate, :y_coordinate, :closing_time, presence: true
end
