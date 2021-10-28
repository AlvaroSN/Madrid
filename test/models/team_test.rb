require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = players(:uno)
  end

  test "id de equipo igual al de su usuario" do
    @team = Team.new(user_id: @user.id)
    assert_equal(@user.id, @team.user_id)
  end


end