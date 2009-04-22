require File.dirname(__FILE__) + '/../test_helper'

class TipoMediosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_medios)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tipo_medio
    assert_difference('TipoMedio.count') do
      post :create, :tipo_medio => { }
    end

    assert_redirected_to tipo_medio_path(assigns(:tipo_medio))
  end

  def test_should_show_tipo_medio
    get :show, :id => tipo_medios(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tipo_medios(:one).id
    assert_response :success
  end

  def test_should_update_tipo_medio
    put :update, :id => tipo_medios(:one).id, :tipo_medio => { }
    assert_redirected_to tipo_medio_path(assigns(:tipo_medio))
  end

  def test_should_destroy_tipo_medio
    assert_difference('TipoMedio.count', -1) do
      delete :destroy, :id => tipo_medios(:one).id
    end

    assert_redirected_to tipo_medios_path
  end
end
