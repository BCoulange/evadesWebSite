require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get qui" do
    get :qui
    assert_response :success
  end

  test "should get principe" do
    get :principe
    assert_response :success
  end

  test "should get galerie" do
    get :galerie
    assert_response :success
  end

end
