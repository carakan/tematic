require File.dirname(__FILE__) + '/../test_helper'

class PrimeraManosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:primera_manos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_primera_mano
    assert_difference('PrimeraMano.count') do
      post :create, :primera_mano => { }
    end

    assert_redirected_to primera_mano_path(assigns(:primera_mano))
  end

  def test_should_show_primera_mano
    get :show, :id => primera_manos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => primera_manos(:one).id
    assert_response :success
  end

  def test_should_update_primera_mano
    put :update, :id => primera_manos(:one).id, :primera_mano => { }
    assert_redirected_to primera_mano_path(assigns(:primera_mano))
  end

  def test_should_destroy_primera_mano
    assert_difference('PrimeraMano.count', -1) do
      delete :destroy, :id => primera_manos(:one).id
    end

    assert_redirected_to primera_manos_path
  end
end
