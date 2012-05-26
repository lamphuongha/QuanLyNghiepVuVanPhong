require 'test_helper'

class HocbongsControllerTest < ActionController::TestCase
  setup do
    @hocbong = hocbongs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hocbongs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hocbong" do
    assert_difference('Hocbong.count') do
      post :create, :hocbong => @hocbong.attributes
    end

    assert_redirected_to hocbong_path(assigns(:hocbong))
  end

  test "should show hocbong" do
    get :show, :id => @hocbong
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hocbong
    assert_response :success
  end

  test "should update hocbong" do
    put :update, :id => @hocbong, :hocbong => @hocbong.attributes
    assert_redirected_to hocbong_path(assigns(:hocbong))
  end

  test "should destroy hocbong" do
    assert_difference('Hocbong.count', -1) do
      delete :destroy, :id => @hocbong
    end

    assert_redirected_to hocbongs_path
  end
end
