# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CoffeeShop', type: :request do
  describe "GET /coffe_shops" do
    it "returns all the shops with status code 200" do
      get coffee_shops_path
      expect(response).to have_http_status(:ok)
    end

    it "returns a single shop with status code 200" do
      shop = create(:coffee_shop)
      get coffee_shop_path(shop)
      expect(response).to have_http_status(:ok)
    end

    it "returns 404 when shop doesn't exist" do
      get coffee_shop_path(99999)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /coffee_shops" do
    it "returns a newly created shop with status code 201" do
      post coffee_shops_path,
           params: attributes_for(:coffee_shop),
           as: :json

      expect(response).to have_http_status(:created)
    end

    it "returns 422 on invalid params" do
      post coffee_shops_path,
           params: attributes_for(:coffee_shop, name: nil),
           as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /coffee_shops/:id" do
    it "returns a updated shop with status code 204" do
      shop = create(:coffee_shop)
      patch coffee_shop_path(shop.id),
            params: { name: "Updated name" },
            as: :json
      expect(response).to have_http_status(:ok)
      expect(shop.reload.name).to eq("Updated name")
    end

    it "returns 404 when trying to update a shop that does not exist" do
      patch coffee_shop_path(99999),
            params: { name: "Updated name" },
            as: :json
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "DELETE /coffee_shops/:id" do
    it "returns 204 on valid delete" do
      shop = create(:coffee_shop)
      delete coffee_shop_path(shop.id)
      expect(response).to have_http_status(:no_content)
    end

    it "returns 404 when trying to delete a shop that does not exist" do
      delete coffee_shop_path(999999)
      expect(response).to have_http_status(:not_found)
    end
  end
end
