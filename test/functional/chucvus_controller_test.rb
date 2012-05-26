require 'test_helper'

class ChucvusControllerTest < ActionController::TestCase
  setup do
    @chucvu = chucvus(:one)
  end

  test "should get indexcvu" do
    get :indexcvu
    assert_response :success
    assert_not_nil assigns(:chucvus)
  end

  test "should get newcvu" do
    get :newcvu
    assert_response :success
  end

  test "should create chucvu" do
    assert_difference('Chucvu.count') do
      post :createcvu, :chucvu => @chucvu.attributes
    end

    assert_redirected_to chucvu_path(assigns(:chucvu))
  end

  test "should show chucvu" do
    get :showcvu, :id => @chucvu
    assert_response :success
  end

  test "should get editcvu" do
    get :editcvu, :id => @chucvu
    assert_response :success
  end

  test "should update chucvu" do
    put :updatecvu, :id => @chucvu, :chucvu => @chucvu.attributes
    assert_redirected_to chucvu_path(assigns(:chucvu))
  end

  test "should destroy chucvu" do
    assert_difference('Chucvu.count', -1) do
      delete :destroycvu, :id => @chucvu
    end

    assert_redirected_to chucvus_path
  end
end
