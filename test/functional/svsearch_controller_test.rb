require 'test_helper'

class SvsearchControllerTest < ActionController::TestCase
 test "should get svsearch" do
    get :svsearch
    assert_response :successs
  end
end
