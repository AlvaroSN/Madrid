class SearchesController < ApplicationController

    def prueba

      #respond_to do |format|
      #format.turbo_stream do
      #@jugadores = Jugador.where("pos LIKE :pos", pos: "%#{params[:search_term]}%")
      #render turbo_stream: turbo_stream.replace( :finder, partial: "jugadors/jugador")
      #end
      #format.html {redirect_to jugadors_url}
      #end

      respond_to do |format|
        format.turbo_stream do
          @jugador = Player.where("name LIKE :pos", pos: "#{params[:search_term]}")
          render turbo_stream: turbo_stream.prepend( :finder, partial: "players/jugador")
        end
        format.html {redirect_to players_url}
      end
    end

    def index

    end

end
