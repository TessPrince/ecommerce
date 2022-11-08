require "test_helper"

class SoapsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get soaps_index_url
    assert_response :success
  end

  test "should get show" do
    get soaps_show_url
    assert_response :success
  end
end
