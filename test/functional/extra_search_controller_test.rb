require 'test_helper'

class ExtraSearchControllerTest < ActionController::TestCase
  test "should get extra_search" do
    get :extra_search
    assert_response :success
  end

end
