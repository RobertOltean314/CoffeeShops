# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Cleaning existing data..."
CoffeeShop.destroy_all

puts "Creating coffee shops..."
10.times do |i|
  CoffeeShop.create!(
    name: "Coffee Shop #{i + 1}",
    address: "#{i + 1} Main Street, Târgu Mureș",
    x_coordinate: 46.5386 + rand(-0.05..0.05),
    y_coordinate: 24.5578 + rand(-0.05..0.05),
    closing_time: DateTime.new(2024, 1, 1, 20 + rand(0..3), 0, 0)
  )
end

puts "Done! Created #{CoffeeShop.count} coffee shops."
