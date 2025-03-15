require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get wildlife" do
    get home_wildlife_url
    assert_response :success
  end

  test "should get portrait" do
    get home_portrait_url
    assert_response :success
  end

  test "should get cars" do
    get home_cars_url
    assert_response :success
  end
end
