require 'test_helper'

class RenderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get render_index_url
    assert_response :success
  end

  test "should get show" do
    get render_show_url
    assert_response :success
  end

  test "should get render" do
    get render_render_url
    assert_response :success
  end

end
