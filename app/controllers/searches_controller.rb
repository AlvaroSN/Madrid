class SearchesController < ApplicationController

    def prueba

      puts "--------------ENTRO EN EL CONTROLADOR----------------"
      #@jugador = Player.where("name LIKE :pos", pos: "#{params[:player]}")
      jugadores = Player.where(name: params[:player])
      @jugador = jugadores.first

      render turbo_stream: turbo_stream.update("portero", partial: "players/jugador", locals:{x:@jugador})


    end

    def index

    end


end
