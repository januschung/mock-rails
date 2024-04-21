require "test_helper"

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :show
    assert_response :success
    assert_equal "Welcome to Rails Mock App!", @response.body
  end
end
