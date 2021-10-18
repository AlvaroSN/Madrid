class SearchesController < ApplicationController

    def prueba
      @jugador = Player.where("name LIKE :pos", pos: "#{params[:search_term]}")
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:finder, partial: "players/jugador")
        end
        format.html {redirect_to players_url}
      end

    end

    def index

    end


end
