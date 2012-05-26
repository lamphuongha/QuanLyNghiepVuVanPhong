require 'test_helper'

class CongvansControllerTest < ActionController::TestCase
  setup do
    @congvan = congvans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:congvans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create congvan" do
    assert_difference('Congvan.count') do
      post :create, :congvan => @congvan.attributes
    end

    assert_redirected_to congvan_path(assigns(:congvan))
  end

  test "should show congvan" do
    get :show, :id => @congvan
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @congvan
    assert_response :success
  end

  test "should update congvan" do
    put :update, :id => @congvan, :congvan => @congvan.attributes
    assert_redirected_to congvan_path(assigns(:congvan))
  end

  test "should destroy congvan" do
    assert_difference('Congvan.count', -1) do
      delete :destroy, :id => @congvan
    end

    assert_redirected_to congvans_path
  end
end
