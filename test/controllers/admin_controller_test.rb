require "test_helper"
class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    login_as(@user)
  end

  test "should get index" do
    get admin_url
    assert_response :success
  end
end
