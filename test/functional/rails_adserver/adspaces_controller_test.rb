require 'test_helper'

module RailsAdserver
  class AdspacesControllerTest < ActionController::TestCase
    setup do
      @adspace = adspaces(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:adspaces)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create adspace" do
      assert_difference('Adspace.count') do
        post :create, adspace: @adspace.attributes
      end
  
      assert_redirected_to adspace_path(assigns(:adspace))
    end
  
    test "should show adspace" do
      get :show, id: @adspace
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @adspace
      assert_response :success
    end
  
    test "should update adspace" do
      put :update, id: @adspace, adspace: @adspace.attributes
      assert_redirected_to adspace_path(assigns(:adspace))
    end
  
    test "should destroy adspace" do
      assert_difference('Adspace.count', -1) do
        delete :destroy, id: @adspace
      end
  
      assert_redirected_to adspaces_path
    end
  end
end
