require File.dirname(__FILE__) + '/../test_helper'
require 'board_title_controller'

# Re-raise errors caught by the controller.
class BoardTitleController; def rescue_action(e) raise e end; end

class BoardTitleControllerTest < Test::Unit::TestCase
  fixtures :board_titles

  def setup
    @controller = BoardTitleController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = board_titles(:first).id
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

    assert_not_nil assigns(:board_titles)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:board_title)
    assert assigns(:board_title).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:board_title)
  end

  def test_create
    num_board_titles = BoardTitle.count

    post :create, :board_title => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_board_titles + 1, BoardTitle.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:board_title)
    assert assigns(:board_title).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      BoardTitle.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      BoardTitle.find(@first_id)
    }
  end
end
