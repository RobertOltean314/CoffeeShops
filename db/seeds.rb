# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do |i|
  CoffeeShop.create(
    name: "Coffee Shop #{i}",
    address: "#{i} Main St",
    x_coordinate: rand(40.0..45.0).round(4),
    y_coordinate: rand(20.0..25.0).round(4),
    closing_time: "22:00"
  )
end