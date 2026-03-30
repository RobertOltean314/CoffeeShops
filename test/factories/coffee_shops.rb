FactoryBot.define do
  factory :coffee_shop do
    name { "Test Coffee Shop" }
    address { " Test Address" }
    x_coordinate { 46.58 }
    y_coordinate { 24.59 }
    closing_time { DateTime.new(2025, 1, 1, 22, 0, 0,) }
  end
end
