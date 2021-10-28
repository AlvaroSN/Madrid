require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest

  test "obtener índice" do
    get "/players/index"
    assert_response :success
  end

  test "comprobar elementos índice" do
    get "/"
    assert_not_nil "h2", "player#index"
  end

  test "creación artículo" do
    assert_difference("Player.count") do
      post players_url, params: { player: { name: 'Alvaro', position: 'Defensa', number: 1, photo: 'foto'  } }
    end
    assert_redirected_to players_index_path
  end

end
