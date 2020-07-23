require 'test_helper'

class ExportControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get export_show_url
    assert_response :success
  end

end
