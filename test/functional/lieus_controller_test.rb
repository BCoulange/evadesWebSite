require 'test_helper'

class LieusControllerTest < ActionController::TestCase
  setup do
    @lieu = lieus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lieus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lieu" do
    assert_difference('Lieu.count') do
      post :create, lieu: { adresse: @lieu.adresse, gMapUrl: @lieu.gMapUrl, nom: @lieu.nom }
    end

    assert_redirected_to lieu_path(assigns(:lieu))
  end

  test "should show lieu" do
    get :show, id: @lieu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lieu
    assert_response :success
  end

  test "should update lieu" do
    put :update, id: @lieu, lieu: { adresse: @lieu.adresse, gMapUrl: @lieu.gMapUrl, nom: @lieu.nom }
    assert_redirected_to lieu_path(assigns(:lieu))
  end

  test "should destroy lieu" do
    assert_difference('Lieu.count', -1) do
      delete :destroy, id: @lieu
    end

    assert_redirected_to lieus_path
  end
end
