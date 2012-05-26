require 'test_helper'

class SinhviensControllerTest < ActionController::TestCase
  setup do
    @sinhvien = sinhviens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sinhviens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sinhvien" do
    assert_difference('Sinhvien.count') do
      post :create, :sinhvien => @sinhvien.attributes
    end

    assert_redirected_to sinhvien_path(assigns(:sinhvien))
  end

  test "should show sinhvien" do
    get :show, :id => @sinhvien
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sinhvien
    assert_response :success
  end

  test "should update sinhvien" do
    put :update, :id => @sinhvien, :sinhvien => @sinhvien.attributes
    assert_redirected_to sinhvien_path(assigns(:sinhvien))
  end

  test "should destroy sinhvien" do
    assert_difference('Sinhvien.count', -1) do
      delete :destroy, :id => @sinhvien
    end

    assert_redirected_to sinhviens_path
  end
end
