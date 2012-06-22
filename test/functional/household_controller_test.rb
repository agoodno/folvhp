require File.dirname(__FILE__) + '/../test_helper'
require 'household_controller'

# Re-raise errors caught by the controller.
class HouseholdController; def rescue_action(e) raise e end; end

class HouseholdControllerTest < Test::Unit::TestCase
  fixtures :households

  def setup
    @controller = HouseholdController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = households(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:households)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:household)
    assert assigns(:household).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:household)
  end

  def test_create
    num_households = Household.count

    post :create, :household => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_households + 1, Household.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:household)
    assert assigns(:household).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Household.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Household.find(@first_id)
    }
  end
end
