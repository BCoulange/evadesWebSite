require 'test_helper'

class ReunionCasControllerTest < ActionController::TestCase
  setup do
    @reunion_ca = reunion_cas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reunion_cas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reunion_ca" do
    assert_difference('ReunionCa.count') do
      post :create, reunion_ca: { compterendu: @reunion_ca.compterendu }
    end

    assert_redirected_to reunion_ca_path(assigns(:reunion_ca))
  end

  test "should show reunion_ca" do
    get :show, id: @reunion_ca
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reunion_ca
    assert_response :success
  end

  test "should update reunion_ca" do
    put :update, id: @reunion_ca, reunion_ca: { compterendu: @reunion_ca.compterendu }
    assert_redirected_to reunion_ca_path(assigns(:reunion_ca))
  end

  test "should destroy reunion_ca" do
    assert_difference('ReunionCa.count', -1) do
      delete :destroy, id: @reunion_ca
    end

    assert_redirected_to reunion_cas_path
  end
end
