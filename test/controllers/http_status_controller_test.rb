require "test_helper"

class HttpStatusControllerTest < ActionController::TestCase
  test "route to http_status#show" do
    assert_routing '/http_status/200', { controller: "http_status", action: "show", code: "200" }
  end


  HTTP_STATUS_CODE_TEST_CASE = {
    200 => "OK",
    301 => "Moved Permanently",
    400 => "Bad Request",
    403 => "Forbidden",
    404 => "Not Found",
    500 => "Internal Server Error",
    503 => "Service Unavailable",
    504 => "Gateway Timeout"
  }

  HTTP_STATUS_CODE_TEST_CASE.each do | input, code|
    test "should return HTTP status code #{code} with input #{input}" do
      get :show, params: { code: input }
      assert_response input
      json_response = JSON.parse(@response.body)
      assert_equal code, json_response["status"]
    end
  end

  INVALID_HTTP_STATUS_CODE_TEST_CASE = [
    "whatever",
    1,
    -1,
    600,
    ""
  ]

  INVALID_HTTP_STATUS_CODE_TEST_CASE.each do | input|
    test "should return HTTP status code 422 with input #{input}" do
      get :show, params: { code: input }
      assert_response 422
      json_response = JSON.parse(@response.body)
      assert_equal "Invalid HTTP status code", json_response["error"]
    end
  end

end
