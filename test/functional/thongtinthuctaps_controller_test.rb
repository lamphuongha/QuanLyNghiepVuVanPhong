require 'test_helper'

class ThongtinthuctapsControllerTest < ActionController::TestCase
  setup do
    @thongtinthuctap = thongtinthuctaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thongtinthuctaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thongtinthuctap" do
    assert_difference('Thongtinthuctap.count') do
      post :create, :thongtinthuctap => @thongtinthuctap.attributes
    end

    assert_redirected_to thongtinthuctap_path(assigns(:thongtinthuctap))
  end

  test "should show thongtinthuctap" do
    get :show, :id => @thongtinthuctap
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @thongtinthuctap
    assert_response :success
  end

  test "should update thongtinthuctap" do
    put :update, :id => @thongtinthuctap, :thongtinthuctap => @thongtinthuctap.attributes
    assert_redirected_to thongtinthuctap_path(assigns(:thongtinthuctap))
  end

  test "should destroy thongtinthuctap" do
    assert_difference('Thongtinthuctap.count', -1) do
      delete :destroy, :id => @thongtinthuctap
    end

    assert_redirected_to thongtinthuctaps_path
  end
end
