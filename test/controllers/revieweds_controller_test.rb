require 'test_helper'

class ReviewedsControllerTest < ActionController::TestCase
  setup do
    @reviewed = revieweds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:revieweds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reviewed" do
    assert_difference('Reviewed.count') do
      post :create, reviewed: { gallina_id: @reviewed.gallina_id, name: @reviewed.name }
    end

    assert_redirected_to reviewed_path(assigns(:reviewed))
  end

  test "should show reviewed" do
    get :show, id: @reviewed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reviewed
    assert_response :success
  end

  test "should update reviewed" do
    patch :update, id: @reviewed, reviewed: { gallina_id: @reviewed.gallina_id, name: @reviewed.name }
    assert_redirected_to reviewed_path(assigns(:reviewed))
  end

  test "should destroy reviewed" do
    assert_difference('Reviewed.count', -1) do
      delete :destroy, id: @reviewed
    end

    assert_redirected_to revieweds_path
  end
end
