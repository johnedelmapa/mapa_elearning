require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_users_home_url
    assert_response :success
  end

end
