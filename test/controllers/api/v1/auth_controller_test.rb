require 'test_helper'

class Api::V1::AuthControllerTest < ActionDispatch::IntegrationTest

  test "returns 200 status, if user could authenticate" do
    User.create(email: "admin@example.com", password: "password")
    post "/api/v1/auth", params: { email: "admin@example.com", password: "password"}

    assert_equal 200, @response.status
    parsed_json = JSON.parse(@response.body)
    assert parsed_json.has_key?("access_token")
    # assert_kind_of String,
  end

  test "returns 401 status, if user could not authenticate" do
    skip 'implement this'
  end

  test "returns 404 status, if user is not found" do
    skip 'implement this'
  end

  test "returns 403 status, if user is banned" do

    User.create(email: "admin@example.com", password: "password", banned: true)
    post "/api/v1/auth", params: { email: "admin@example.com", password: "password"}
    
    assert_equal 403, @response.status
    # parsed_json = JSON.parse(@response.body)
    # assert parsed_json.has_key?("access_token")
  end

  test "returns 401 status, if email or password is not given" do
    post "/api/v1/auth"

    # byebug

    assert_equal 401, @response.status
    parsed_json = JSON.parse(@response.body)
    assert_equal 401, parsed_json["error"]["code"]
 
  end

end
