require "test_helper"

class Admin::VendorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_vendors_index_url
    assert_response :success
  end
end
