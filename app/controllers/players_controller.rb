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

    def edit
      @jugador = Player.find(params[:id])
    end

    def update
      @jugador = Player.find(params[:id])
      if @jugador.update(params_jugador)
        redirect_to @jugador
      else
        render 'edit'
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

    def team
      @porteros = Player.where({:position => 'Portero'})
      @defensas = Player.where({:position => 'Defensa'})
      @mediocentros = Player.where({:position => 'Centrocampista'})
      @delanteros = Player.where({:position => 'Delantero'})
    end

    private
    def params_jugador
      params.require(:player).permit(:name,:number,:position,:photo)
    end

end
