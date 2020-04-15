require 'test_helper'

class CuisineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cuisine_index_url
    assert_response :success
  end

end
