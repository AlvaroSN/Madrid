require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest

  test "can see the index page" do
    get "/"
    assert_select "h1", "player#index"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "index should render correct template and layout" do
    get :index
    assert_template :index
    assert_template layout: "layouts/application"
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: {name: 'Nombre'}
    end
    assert_redirected_to player_path(assigns(:player))
  end


end
