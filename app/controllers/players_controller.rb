class PlayersController < ApplicationController

  before_action :require_login, only: [:updateTeam]

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

      unless Team.exists? user_id: current_user.id
        puts("------------------Plantilla nueva creada para el usuario---------------------")
        @team = Team.new()
        @team.user_id = current_user.id
        @team.save!
      else
        puts("-----------------El usuario ya tiene una plantilla creada---------------------")
        @team = Team.find_by user_id: current_user.id
      end
    end

  def updateTeam
    @team = Team.find_by user_id: current_user.id
    @result = []
    @result.push()
    @team.update(team_params)
  end

    private
    def params_jugador
      params.require(:player).permit(:name,:number,:position,:photo)
    end

    def team_params
      params.permit(:PO, :LI, :DCI, :DCD, :LD, :MCI, :MD, :MCD, :EI, :DC, :ED)
    end

    def require_login
      unless signed_in?
        redirect_to new_user_session_url, alert: "Debes iniciar sesión para poder acceder"
      end
    end

end
