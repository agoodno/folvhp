require File.dirname(__FILE__) + '/../test_helper'
require 'uploaded_file_controller'

# Re-raise errors caught by the controller.
class UploadedFileController; def rescue_action(e) raise e end; end

class UploadedFileControllerTest < Test::Unit::TestCase
  fixtures :uploaded_files

  def setup
    @controller = UploadedFileController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = uploaded_files(:first).id
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

    assert_not_nil assigns(:uploaded_files)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:uploaded_file)
    assert assigns(:uploaded_file).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:uploaded_file)
  end

  def test_create
    num_uploaded_files = UploadedFile.count

    post :create, :uploaded_file => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_uploaded_files + 1, UploadedFile.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:uploaded_file)
    assert assigns(:uploaded_file).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      UploadedFile.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      UploadedFile.find(@first_id)
    }
  end
end
