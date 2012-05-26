require 'test_helper'

class BuocthoihocsControllerTest < ActionController::TestCase
  setup do
    @buocthoihoc = buocthoihocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buocthoihocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buocthoihoc" do
    assert_difference('Buocthoihoc.count') do
      post :create, :buocthoihoc => @buocthoihoc.attributes
    end

    assert_redirected_to buocthoihoc_path(assigns(:buocthoihoc))
  end

  test "should show buocthoihoc" do
    get :show, :id => @buocthoihoc
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @buocthoihoc
    assert_response :success
  end

  test "should update buocthoihoc" do
    put :update, :id => @buocthoihoc, :buocthoihoc => @buocthoihoc.attributes
    assert_redirected_to buocthoihoc_path(assigns(:buocthoihoc))
  end

  test "should destroy buocthoihoc" do
    assert_difference('Buocthoihoc.count', -1) do
      delete :destroy, :id => @buocthoihoc
    end

    assert_redirected_to buocthoihocs_path
  end
end
