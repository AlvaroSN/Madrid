class PlayersController < ApplicationController

    def index
      @jugador = Player.all
    end

    def new
      @jugador = Player.new
    end

    def create
      @jugador = Player.create(params_jugador)
      if @jugador.save
        redirect_to players_index_path
      else
        render 'new'
      end
    end

    def show
      @jugador = Player.find(params[:id])
    end

    def destroy
      @jugador = Player.find(params[:id])
      @jugador.destroy
      redirect_to players_index_path
    end

    private
    def params_jugador
      params.require(:player).permit(:name,:number,:position,:photo)
    end

end
