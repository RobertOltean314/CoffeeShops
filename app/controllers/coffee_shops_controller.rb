class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: %i[show update destroy]

  def index
    shops = CoffeeShop.all
    render json: shops, status: :ok
  end

  def show
    render json: @shop, status: :ok
  end

  def create
    shop = CoffeeShop.create!(coffee_shop_params)
    render json: shop, status: :created
  end

  def update
    @shop.update!(coffee_shop_params)
    render json: @shop, status: :ok
  end

  def destroy
    @shop.destroy!
    head :no_content
  end

  private

  def set_coffee_shop
    @shop = CoffeeShop.find(params[:id])
  end

  def coffee_shop_params
    params.permit(:name, :address, :x_coordinate, :y_coordinate, :closing_time)
  end
end
