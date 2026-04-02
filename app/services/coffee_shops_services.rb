# frozen_string_literal: true

class CoffeeShopsServices

  def calculate_distance(x, y)
    CoffeeShop.all.sort_by { |shop| shop.calculate_distance(x, y) }
  end
end
