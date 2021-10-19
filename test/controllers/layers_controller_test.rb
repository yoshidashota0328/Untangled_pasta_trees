require 'test_helper'

class LayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get layers_index_url
    assert_response :success
  end

end
