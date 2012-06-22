require File.dirname(__FILE__) + '/../test_helper'
require 'join_requests_controller'

# Re-raise errors caught by the controller.
class JoinRequestsController; def rescue_action(e) raise e end; end

class JoinRequestsControllerTest < Test::Unit::TestCase
  fixtures :join_requests

  def setup
    @controller = JoinRequestsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:join_requests)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_join_request
    old_count = JoinRequest.count
    post :create, :join_request => { }
    assert_equal old_count+1, JoinRequest.count
    
    assert_redirected_to join_request_path(assigns(:join_request))
  end

  def test_should_show_join_request
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_join_request
    put :update, :id => 1, :join_request => { }
    assert_redirected_to join_request_path(assigns(:join_request))
  end
  
  def test_should_destroy_join_request
    old_count = JoinRequest.count
    delete :destroy, :id => 1
    assert_equal old_count-1, JoinRequest.count
    
    assert_redirected_to join_requests_path
  end
end
