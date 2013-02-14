require 'test_helper'

class CavalesControllerTest < ActionController::TestCase
  setup do
    @cavale = cavales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cavales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cavale" do
    assert_difference('Cavale.count') do
      post :create, cavale: { message: @cavale.message, titre: @cavale.titre }
    end

    assert_redirected_to cavale_path(assigns(:cavale))
  end

  test "should show cavale" do
    get :show, id: @cavale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cavale
    assert_response :success
  end

  test "should update cavale" do
    put :update, id: @cavale, cavale: { message: @cavale.message, titre: @cavale.titre }
    assert_redirected_to cavale_path(assigns(:cavale))
  end

  test "should destroy cavale" do
    assert_difference('Cavale.count', -1) do
      delete :destroy, id: @cavale
    end

    assert_redirected_to cavales_path
  end
end
