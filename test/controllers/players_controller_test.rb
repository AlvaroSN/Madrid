require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest

  test "can see the index page" do
    get "/"
    assert_not_nil "h2", "player#index"
  end

  test "should get index" do
    get "/players/index"
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: {name: 'Nombre'}
    end
    assert_redirected_to player_path(assigns(:player))
  end


end
