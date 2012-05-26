require 'test_helper'

class BaoluusControllerTest < ActionController::TestCase
  setup do
    @baoluu = baoluus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baoluus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baoluu" do
    assert_difference('Baoluu.count') do
      post :create, :baoluu => @baoluu.attributes
    end

    assert_redirected_to baoluu_path(assigns(:baoluu))
  end

  test "should show baoluu" do
    get :show, :id => @baoluu
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @baoluu
    assert_response :success
  end

  test "should update baoluu" do
    put :update, :id => @baoluu, :baoluu => @baoluu.attributes
    assert_redirected_to baoluu_path(assigns(:baoluu))
  end

  test "should destroy baoluu" do
    assert_difference('Baoluu.count', -1) do
      delete :destroy, :id => @baoluu
    end

    assert_redirected_to baoluus_path
  end
end
