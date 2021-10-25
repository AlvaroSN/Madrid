class SearchesController < ApplicationController

  def prueba
    puts "--------------ENTRO EN EL CONTROLADOR----------------"
    #@jugador = Player.where("name LIKE :pos", pos: "#{params[:player]}")
    jugadores = Player.where(name: params[:player])
    pos = params[:pos]
    @jugador = jugadores.first
    render turbo_stream: turbo_stream.update(pos, partial: "players/jugador", locals:{x:@jugador, :n => nil})
  end

end
