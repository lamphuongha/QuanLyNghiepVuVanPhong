require 'test_helper'

class TrocapsControllerTest < ActionController::TestCase
  setup do
    @trocap = trocaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trocaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trocap" do
    assert_difference('Trocap.count') do
      post :create, :trocap => @trocap.attributes
    end

    assert_redirected_to trocap_path(assigns(:trocap))
  end

  test "should show trocap" do
    get :show, :id => @trocap
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @trocap
    assert_response :success
  end

  test "should update trocap" do
    put :update, :id => @trocap, :trocap => @trocap.attributes
    assert_redirected_to trocap_path(assigns(:trocap))
  end

  test "should destroy trocap" do
    assert_difference('Trocap.count', -1) do
      delete :destroy, :id => @trocap
    end

    assert_redirected_to trocaps_path
  end
end
