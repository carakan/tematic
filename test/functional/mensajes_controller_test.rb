require File.dirname(__FILE__) + '/../test_helper'

class MensajesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:mensajes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_mensaje
    assert_difference('Mensaje.count') do
      post :create, :mensaje => { }
    end

    assert_redirected_to mensaje_path(assigns(:mensaje))
  end

  def test_should_show_mensaje
    get :show, :id => mensajes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => mensajes(:one).id
    assert_response :success
  end

  def test_should_update_mensaje
    put :update, :id => mensajes(:one).id, :mensaje => { }
    assert_redirected_to mensaje_path(assigns(:mensaje))
  end

  def test_should_destroy_mensaje
    assert_difference('Mensaje.count', -1) do
      delete :destroy, :id => mensajes(:one).id
    end

    assert_redirected_to mensajes_path
  end
end
