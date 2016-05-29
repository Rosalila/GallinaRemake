require 'test_helper'

class CorralsControllerTest < ActionController::TestCase
  setup do
    @corral = corrals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:corrals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create corral" do
    assert_difference('Corral.count') do
      post :create, corral: { agreement: @corral.agreement, description: @corral.description, image: @corral.image, name: @corral.name }
    end

    assert_redirected_to corral_path(assigns(:corral))
  end

  test "should show corral" do
    get :show, id: @corral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @corral
    assert_response :success
  end

  test "should update corral" do
    patch :update, id: @corral, corral: { agreement: @corral.agreement, description: @corral.description, image: @corral.image, name: @corral.name }
    assert_redirected_to corral_path(assigns(:corral))
  end

  test "should destroy corral" do
    assert_difference('Corral.count', -1) do
      delete :destroy, id: @corral
    end

    assert_redirected_to corrals_path
  end
end
