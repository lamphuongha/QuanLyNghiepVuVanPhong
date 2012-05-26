require 'test_helper'

class NoitrusControllerTest < ActionController::TestCase
  setup do
    @noitru = noitrus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:noitrus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create noitru" do
    assert_difference('Noitru.count') do
      post :create, :noitru => @noitru.attributes
    end

    assert_redirected_to noitru_path(assigns(:noitru))
  end

  test "should show noitru" do
    get :show, :id => @noitru
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @noitru
    assert_response :success
  end

  test "should update noitru" do
    put :update, :id => @noitru, :noitru => @noitru.attributes
    assert_redirected_to noitru_path(assigns(:noitru))
  end

  test "should destroy noitru" do
    assert_difference('Noitru.count', -1) do
      delete :destroy, :id => @noitru
    end

    assert_redirected_to noitrus_path
  end
end
