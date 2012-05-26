require 'test_helper'

class NgoaitrusControllerTest < ActionController::TestCase
  setup do
    @ngoaitru = ngoaitrus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ngoaitrus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ngoaitru" do
    assert_difference('Ngoaitru.count') do
      post :create, :ngoaitru => @ngoaitru.attributes
    end

    assert_redirected_to ngoaitru_path(assigns(:ngoaitru))
  end

  test "should show ngoaitru" do
    get :show, :id => @ngoaitru
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ngoaitru
    assert_response :success
  end

  test "should update ngoaitru" do
    put :update, :id => @ngoaitru, :ngoaitru => @ngoaitru.attributes
    assert_redirected_to ngoaitru_path(assigns(:ngoaitru))
  end

  test "should destroy ngoaitru" do
    assert_difference('Ngoaitru.count', -1) do
      delete :destroy, :id => @ngoaitru
    end

    assert_redirected_to ngoaitrus_path
  end
end
