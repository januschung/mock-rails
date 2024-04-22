require "test_helper"

class ResourceControllerTest < ActionController::TestCase
  test "route to resource#resource" do
    assert_routing '/resource/100', { controller: "resource", action: "resource", data: "100" }
  end

  DATA_TEST_CASE = {
    100 => [{"id"=>"100", "name"=>"jack", "age"=>"30"}, {"id"=>"101", "name"=>"jill", "age"=>"32"}],
    200 => [{"id"=>"200", "name"=>"tom", "age"=>"40"}, {"id"=>"201", "name"=>"jerry", "age"=>"28"}],
    "999" => [],
    "whatever" => [],
  }

  DATA_TEST_CASE.each do | input, result|
    test "should return expected result with input of data file #{input}" do
      get :resource, params: { data: input }
      assert_response 200
      json_response = JSON.parse(@response.body)
      assert_equal result, json_response
    end
  end

end
