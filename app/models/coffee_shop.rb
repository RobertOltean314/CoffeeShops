class CoffeeShop < ApplicationRecord
  validates :name, :address, :x_coordinate, :y_coordinate, :closing_time, presence: true
  validates :x_coordinate, numericality: true
  validates :y_coordinate, numericality: true
end
