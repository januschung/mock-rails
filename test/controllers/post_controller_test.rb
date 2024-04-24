require "test_helper"

class PostControllerTest < ActionController::TestCase
  setup do
    @data_file = Tempfile.new("test_data")
    @data_file.write(SecureRandom.hex)
    @data_file.rewind
  end

  teardown do
    @data_file.close
    @data_file.unlink
  end

  test "route to post#post_json" do
    assert_routing({ method: 'post', path: '/post/json' }, { controller: "post", action: "post_json" })
    assert_recognizes({controller: 'post', action: 'post_json', display_payload: 'true'}, {path: '/post/json', method: :post}, { display_payload: "true" })
  end
  
  test "should post data with payload and duration" do
    post :post_json, params: { display_payload: 'true', data: @data_file.read }, as: :json
    
    assert_response :success
    response_json = JSON.parse(@response.body)
    assert_not_nil response_json["payload"]
    assert_not_nil response_json["duration"]
  end

  test "should post data without payload" do
    post :post_json, body: { data: @data_file.read }.to_json, as: :json

    assert_response :success
    response_json = JSON.parse(@response.body)
    assert_nil response_json["payload"]
    assert_not_nil response_json["duration"]
  end

  test "should post data with payload and duration with 10MB payload" do
    # Generate 10MB of data file
    chunk_size = 10 * 1024 * 1024
    data = '0' * chunk_size
    @data_file.write(data)
    @data_file.rewind

    post :post_json, params: { display_payload: 'true', data: @data_file.read }, as: :json
    
    assert_response :success
    response_json = JSON.parse(@response.body)
    assert_not_nil response_json["payload"]
    assert_not_nil response_json["duration"]
  end

  test "should post data without payload with 10MB payload" do
    # Generate 10MB of data file
    chunk_size = 10 * 1024 * 1024
    data = '0' * chunk_size
    @data_file.write(data)
    @data_file.rewind

    post :post_json, params: { data: @data_file.read }, as: :json
    
    assert_response :success
    response_json = JSON.parse(@response.body)
    assert_nil response_json["payload"]
    assert_not_nil response_json["duration"]
  end

  test "should return unprocessable entity with invalid JSON payload" do
    post :post_json, body: "invalid_json_data", as: :json

    assert_response :unprocessable_entity
    response_json = JSON.parse(@response.body)
    assert_equal "Invalid JSON format in payload", response_json["error"]
  end
end
