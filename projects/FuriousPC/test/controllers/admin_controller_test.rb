require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get customer" do
    get :customer
    assert_response :success
  end

end
