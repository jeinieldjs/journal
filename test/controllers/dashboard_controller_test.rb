require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should get index' do
    get dashboard_index_path
    assert_response :success
    assert_template 'index'
  end
end
