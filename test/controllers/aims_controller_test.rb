require 'test_helper'

class AimsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aims_index_url
    assert_response :success
  end

end
