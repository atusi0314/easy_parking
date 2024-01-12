require "test_helper"

class ParkingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get parkings_new_url
    assert_response :success
  end

  test "should get index" do
    get parkings_index_url
    assert_response :success
  end

  test "should get show" do
    get parkings_show_url
    assert_response :success
  end
end
