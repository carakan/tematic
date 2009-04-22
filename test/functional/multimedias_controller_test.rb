require File.dirname(__FILE__) + '/../test_helper'

class MultimediasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:multimedias)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_multimedia
    assert_difference('Multimedia.count') do
      post :create, :multimedia => { }
    end

    assert_redirected_to multimedia_path(assigns(:multimedia))
  end

  def test_should_show_multimedia
    get :show, :id => multimedias(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => multimedias(:one).id
    assert_response :success
  end

  def test_should_update_multimedia
    put :update, :id => multimedias(:one).id, :multimedia => { }
    assert_redirected_to multimedia_path(assigns(:multimedia))
  end

  def test_should_destroy_multimedia
    assert_difference('Multimedia.count', -1) do
      delete :destroy, :id => multimedias(:one).id
    end

    assert_redirected_to multimedias_path
  end
end
