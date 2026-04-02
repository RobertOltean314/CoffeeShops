class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: %i[show update destroy]
  allow_unauthenticated_access only: %i[ index show nearest ]

  def index
    shops = CoffeeShop.all
    render json: shops, status: :ok
  end

  def show
    render json: @shop, status: :ok
  end

  def create
    if current_user
      shop = CoffeeShop.create!(coffee_shop_params)
      render json: shop, status: :created
    else
      render json: { error: "Invalid Token" }, status: :unauthorized
    end
  end

  def update
    if current_user
      @shop.update!(coffee_shop_params)
      render json: @shop, status: :ok
    else
      render json: { error: "Invalid Token" }, status: :unauthorized
    end
  end

  def destroy

    if current_user
      @shop.destroy!
      head :no_content
    else
      render json: { error: "Invalid Token" }, status: :unauthorized
    end

  end

  def nearest
    x = params[:x].to_f
    y = params[:y].to_f

    closest_shops = coffee_shop_service.calculate_distance(x, y)

    render json: { highlight: 3, shops: closest_shops }, status: :ok
  end

  private

  def set_coffee_shop
    @shop = CoffeeShop.find(params[:id])
  end

  def coffee_shop_params
    params.permit(:name, :address, :x_coordinate, :y_coordinate, :closing_time)
  end

  def coffee_shop_service
    @coffee_shops_service ||= CoffeeShopsServices.new
  end
end
