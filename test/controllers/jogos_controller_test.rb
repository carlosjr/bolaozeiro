require 'test_helper'

class JogosControllerTest < ActionController::TestCase
  setup do
    @jogo = jogos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jogos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jogo" do
    assert_difference('Jogo.count') do
      post :create, jogo: { data: @jogo.data, gols_a: @jogo.gols_a, gols_b: @jogo.gols_b, hora: @jogo.hora, time_a: @jogo.time_a, time_b: @jogo.time_b }
    end

    assert_redirected_to jogo_path(assigns(:jogo))
  end

  test "should show jogo" do
    get :show, id: @jogo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jogo
    assert_response :success
  end

  test "should update jogo" do
    patch :update, id: @jogo, jogo: { data: @jogo.data, gols_a: @jogo.gols_a, gols_b: @jogo.gols_b, hora: @jogo.hora, time_a: @jogo.time_a, time_b: @jogo.time_b }
    assert_redirected_to jogo_path(assigns(:jogo))
  end

  test "should destroy jogo" do
    assert_difference('Jogo.count', -1) do
      delete :destroy, id: @jogo
    end

    assert_redirected_to jogos_path
  end
end
