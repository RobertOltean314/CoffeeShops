require "test_helper"

class CoffeeShopsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "returns all the shops with status code 200" do
    get coffee_shops_path
    assert_response :ok
  end

  test "returns a single shop with status code 200" do
    shop = create(:coffee_shop)
    get coffee_shop_path(shop.id)
    assert_response :ok
  end

  test "returns a newly created shop with status code 201" do
    post coffee_shops_path,
      params: attributes_for(:coffee_shop),
      as: :json
    assert_response :created
  end

  test "returns 422 on invalid params" do
    post coffee_shops_path,
      params: attributes_for(:coffee_shop).except(:name),
      as: :json
    assert_response :unprocessable_content
  end

  test "returns 404 when shop does not exist" do
    get coffee_shop_path(1000000)
    assert_response :not_found
  end

  test "returns an updated shop with status code 200 and correct name" do
    shop = create(:coffee_shop)
    patch coffee_shop_path(shop.id),
      params: { name: "Test Coffee Shop Update" },
      as: :json
    assert_response :ok
    assert_equal "Test Coffee Shop Update", JSON.parse(response.body)["name"]
  end

  test "returns 404 when updating a shop that does not exist" do
    patch coffee_shop_path(99999),
      params: { name: "Test" },
      as: :json
    assert_response :not_found
  end

  test "returns 204 on valid delete" do
    shop = create(:coffee_shop)
    delete coffee_shop_path(shop.id)
    assert_response :no_content
  end

  test "returns 404 when deleting a shop that does not exist" do
    delete coffee_shop_path(999999)
    assert_response :not_found
  end

  test "returns 422 when name is missing" do
    post coffee_shops_path,
      params: attributes_for(:coffee_shop).except(:name),
      as: :json
  assert_response :unprocessable_entity
  end
end
