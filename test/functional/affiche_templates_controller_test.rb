require 'test_helper'

class AfficheTemplatesControllerTest < ActionController::TestCase
  setup do
    @affiche_template = affiche_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affiche_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affiche_template" do
    assert_difference('AfficheTemplate.count') do
      post :create, affiche_template: { dh_heigh: @affiche_template.dh_heigh, dh_width: @affiche_template.dh_width, dh_x: @affiche_template.dh_x, dh_y: @affiche_template.dh_y, lieu_heigh: @affiche_template.lieu_heigh, lieu_width: @affiche_template.lieu_width, lieu_x: @affiche_template.lieu_x, lieu_y: @affiche_template.lieu_y, teaser_heigh: @affiche_template.teaser_heigh, teaser_width: @affiche_template.teaser_width, teaser_x: @affiche_template.teaser_x, teaser_y: @affiche_template.teaser_y }
    end

    assert_redirected_to affiche_template_path(assigns(:affiche_template))
  end

  test "should show affiche_template" do
    get :show, id: @affiche_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @affiche_template
    assert_response :success
  end

  test "should update affiche_template" do
    put :update, id: @affiche_template, affiche_template: { dh_heigh: @affiche_template.dh_heigh, dh_width: @affiche_template.dh_width, dh_x: @affiche_template.dh_x, dh_y: @affiche_template.dh_y, lieu_heigh: @affiche_template.lieu_heigh, lieu_width: @affiche_template.lieu_width, lieu_x: @affiche_template.lieu_x, lieu_y: @affiche_template.lieu_y, teaser_heigh: @affiche_template.teaser_heigh, teaser_width: @affiche_template.teaser_width, teaser_x: @affiche_template.teaser_x, teaser_y: @affiche_template.teaser_y }
    assert_redirected_to affiche_template_path(assigns(:affiche_template))
  end

  test "should destroy affiche_template" do
    assert_difference('AfficheTemplate.count', -1) do
      delete :destroy, id: @affiche_template
    end

    assert_redirected_to affiche_templates_path
  end
end
