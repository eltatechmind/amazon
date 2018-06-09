require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get root_path
    assert_response :success
    assert_select "title", "Sign up | Amazon"
  end



end
