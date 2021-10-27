require "test_helper"

class PlayerTest < ActiveSupport::TestCase

  #Comando para los tests: rails db:test:prepare

  setup do
    @user1 = players(:uno)
    @user2 = players(:dos)
  end

  test "jugador con todos los parámetros" do
    player = Player.new
    assert_not player.save, "Jugador guardado sin algún parámetro"
  end

  test "acceso a parámetros de jugador" do
    assert_equal("Nombre1", @user1.name)
  end

  test "jugadores con disintos id" do
    assert_not(Player.new(name: 'Nombre1', photo: 'a', number: 1, position: 'Defensa').save)
  end

end
