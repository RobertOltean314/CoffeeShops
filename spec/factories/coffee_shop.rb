FactoryBot.define do
  factory :coffee_shop do
    name { "My Coffee Shop" }
    address { "123 Main St" }
    x_coordinate { 40.7128 }
    y_coordinate { -74.0060 }
    closing_time { "22:00" }
  end
end