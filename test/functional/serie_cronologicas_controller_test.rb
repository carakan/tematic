require File.dirname(__FILE__) + '/../test_helper'

class SerieCronologicasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:serie_cronologicas)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_serie_cronologica
    assert_difference('SerieCronologica.count') do
      post :create, :serie_cronologica => { }
    end

    assert_redirected_to serie_cronologica_path(assigns(:serie_cronologica))
  end

  def test_should_show_serie_cronologica
    get :show, :id => serie_cronologicas(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => serie_cronologicas(:one).id
    assert_response :success
  end

  def test_should_update_serie_cronologica
    put :update, :id => serie_cronologicas(:one).id, :serie_cronologica => { }
    assert_redirected_to serie_cronologica_path(assigns(:serie_cronologica))
  end

  def test_should_destroy_serie_cronologica
    assert_difference('SerieCronologica.count', -1) do
      delete :destroy, :id => serie_cronologicas(:one).id
    end

    assert_redirected_to serie_cronologicas_path
  end
end
