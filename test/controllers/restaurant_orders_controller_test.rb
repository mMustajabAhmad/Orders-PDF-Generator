require "test_helper"

class RestaurantOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get restaurant_orders_show_url
    assert_response :success
  end
end
