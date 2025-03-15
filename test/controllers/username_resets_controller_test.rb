require "test_helper"

class UsernameResetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get username_resets_new_url
    assert_response :success
  end

  test "should get create" do
    get username_resets_create_url
    assert_response :success
  end
end
