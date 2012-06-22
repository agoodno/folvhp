require File.dirname(__FILE__) + '/../test_helper'
require 'member_level_controller'

# Re-raise errors caught by the controller.
class MemberLevelController; def rescue_action(e) raise e end; end

class MemberLevelControllerTest < Test::Unit::TestCase
  fixtures :member_levels

  def setup
    @controller = MemberLevelController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = member_levels(:first).id
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

    assert_not_nil assigns(:member_levels)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:member_level)
    assert assigns(:member_level).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:member_level)
  end

  def test_create
    num_member_levels = MemberLevel.count

    post :create, :member_level => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_member_levels + 1, MemberLevel.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:member_level)
    assert assigns(:member_level).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      MemberLevel.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      MemberLevel.find(@first_id)
    }
  end
end
