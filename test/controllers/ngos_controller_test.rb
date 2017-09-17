require 'test_helper'

class NgosControllerTest < ActionController::TestCase
  setup do
    @ngo = ngos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ngos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ngo" do
    assert_difference('Ngo.count') do
      post :create, ngo: { name: @ngo.name, password: @ngo.password }
    end

    assert_redirected_to ngo_path(assigns(:ngo))
  end

  test "should show ngo" do
    get :show, id: @ngo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ngo
    assert_response :success
  end

  test "should update ngo" do
    patch :update, id: @ngo, ngo: { name: @ngo.name, password: @ngo.password }
    assert_redirected_to ngo_path(assigns(:ngo))
  end

  test "should destroy ngo" do
    assert_difference('Ngo.count', -1) do
      delete :destroy, id: @ngo
    end

    assert_redirected_to ngos_path
  end
end
