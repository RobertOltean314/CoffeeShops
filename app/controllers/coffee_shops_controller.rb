class CoffeeShopsController < ApplicationController
  before_action :set_coffee_shop, only: %i[show update destroy]

  def index
    render json: CoffeeShop.all, status: :ok
  end

  def show
    render json: @shop, status: :ok
  end

  def create
    shop = CoffeeShop.new(coffee_shop_params)

    if shop.save
      render json: shop, status: :created
    else
      render json: { errors: shop.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @shop.update(coffee_shop_params)
      render json: @shop, status: :ok
    else
      render json: { errors: @shop.errors.full_messages }, status: :unprocessable_entity
    end
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
    params.require(:coffee_shop).permit(:name, :address, :x_coordinate, :y_coordinate, :closing_time)
  end
end
