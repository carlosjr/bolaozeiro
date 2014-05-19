require 'test_helper'

class PalpitesControllerTest < ActionController::TestCase
  setup do
    @palpite = palpites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:palpites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create palpite" do
    assert_difference('Palpite.count') do
      post :create, palpite: { gols_a: @palpite.gols_a, gols_b: @palpite.gols_b, jogo_id: @palpite.jogo_id, pontos: @palpite.pontos, usuario_id: @palpite.usuario_id }
    end

    assert_redirected_to palpite_path(assigns(:palpite))
  end

  test "should show palpite" do
    get :show, id: @palpite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @palpite
    assert_response :success
  end

  test "should update palpite" do
    patch :update, id: @palpite, palpite: { gols_a: @palpite.gols_a, gols_b: @palpite.gols_b, jogo_id: @palpite.jogo_id, pontos: @palpite.pontos, usuario_id: @palpite.usuario_id }
    assert_redirected_to palpite_path(assigns(:palpite))
  end

  test "should destroy palpite" do
    assert_difference('Palpite.count', -1) do
      delete :destroy, id: @palpite
    end

    assert_redirected_to palpites_path
  end
end
