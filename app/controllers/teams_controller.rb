class TeamsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :show, :index]

  def new
    @team = Team.new
    @team = current_user.teams.build(team_params)
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      redirect_to team_path
    else
      render 'new'
    end
  end

  def edit
    @team
  end

  def update

  end


  private
  def team_params
    params.require(:team).permit(:po, :li, :di, :dd, :ld, :mi, :mc, :md, :ei, :dc, :ed)
  end

end