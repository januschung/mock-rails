require "test_helper"

class DelayControllerTest < ActionController::TestCase
  test "route to delay#delay" do
    assert_routing '/delay/1', { controller: "delay", action: "delay", ms: "1" }
  end

  DELAY_TEST_CASE = [
    1,
    10,
    100,
    1000
  ]

  DELAY_TEST_CASE.each do | input|
    test "should return response with delay of #{input} ms" do
      get :delay, params: { ms: input }
      assert_response 200
      json_response = JSON.parse(@response.body)
      assert_equal "Response with delay of #{input} milliseconds", json_response["message"] 
    end
  end

end
