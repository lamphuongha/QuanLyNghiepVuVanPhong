require 'test_helper'

class GiangviensControllerTest < ActionController::TestCase
  setup do
    @giangvien = giangviens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:giangviens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create giangvien" do
    assert_difference('Giangvien.count') do
      post :create, :giangvien => @giangvien.attributes
    end

    assert_redirected_to giangvien_path(assigns(:giangvien))
  end

  test "should show giangvien" do
    get :show, :id => @giangvien
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @giangvien
    assert_response :success
  end

  test "should update giangvien" do
    put :update, :id => @giangvien, :giangvien => @giangvien.attributes
    assert_redirected_to giangvien_path(assigns(:giangvien))
  end

  test "should destroy giangvien" do
    assert_difference('Giangvien.count', -1) do
      delete :destroy, :id => @giangvien
    end

    assert_redirected_to giangviens_path
  end
end
