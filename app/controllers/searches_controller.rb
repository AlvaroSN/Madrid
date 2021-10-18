class SearchesController < ApplicationController

    def prueba
      @jugador = Player.where("name LIKE :pos", pos: "#{params[:PO]}")
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("foto", partial: "players/jugador", locals:{x:@jugador})
        end
        format.html {redirect_to players_url}
      end

    end

    def index

    end


end
