require File.dirname(__FILE__) + '/../test_helper'

class CalendariosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:calendarios)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_calendario
    assert_difference('Calendario.count') do
      post :create, :calendario => { }
    end

    assert_redirected_to calendario_path(assigns(:calendario))
  end

  def test_should_show_calendario
    get :show, :id => calendarios(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => calendarios(:one).id
    assert_response :success
  end

  def test_should_update_calendario
    put :update, :id => calendarios(:one).id, :calendario => { }
    assert_redirected_to calendario_path(assigns(:calendario))
  end

  def test_should_destroy_calendario
    assert_difference('Calendario.count', -1) do
      delete :destroy, :id => calendarios(:one).id
    end

    assert_redirected_to calendarios_path
  end
end
