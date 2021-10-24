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

    def updateTeam
      puts(team)
      if !Team.exists? user_id: current_user.id
        puts ("Aún no existe el equipo")
        @team = Team.new(team_params)
        @team.user_id = current_user.id
        @team.save!
      else
        puts ("Ya existe el equipo")
        @team = current_user.team
        @team.update(team_params)
      end
      #@user = User.includes("team").find(current_user.id)
    end

    private
    def params_jugador
      params.require(:player).permit(:name,:number,:position,:photo)
    end

    def team_params
      params.permit(:PO, :LI, :DCI, :DCD, :LD, :MCI, :MD, :MCD, :EI, :DC, :ED)
    end

end
