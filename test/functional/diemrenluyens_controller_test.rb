require 'test_helper'

class DiemrenluyensControllerTest < ActionController::TestCase
  setup do
    @diemrenluyen = diemrenluyens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diemrenluyens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diemrenluyen" do
    assert_difference('Diemrenluyen.count') do
      post :create, :diemrenluyen => @diemrenluyen.attributes
    end

    assert_redirected_to diemrenluyen_path(assigns(:diemrenluyen))
  end

  test "should show diemrenluyen" do
    get :show, :id => @diemrenluyen
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @diemrenluyen
    assert_response :success
  end

  test "should update diemrenluyen" do
    put :update, :id => @diemrenluyen, :diemrenluyen => @diemrenluyen.attributes
    assert_redirected_to diemrenluyen_path(assigns(:diemrenluyen))
  end

  test "should destroy diemrenluyen" do
    assert_difference('Diemrenluyen.count', -1) do
      delete :destroy, :id => @diemrenluyen
    end

    assert_redirected_to diemrenluyens_path
  end
end
