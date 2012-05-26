require 'test_helper'

class ChitietControllerTest < ActionController::TestCase
  test "should get chitiet" do
    get :chitiet
    assert_response :success
  end

end
