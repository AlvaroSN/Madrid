class AdminsController < ApplicationController

  def index
    @usuarios = User.all
  end

  def new

  end

  def create
    @usuarios = User.create(params_usuarios)
    if @usuarios.save
      redirect_to admins_path
    else
      render 'new'
    end
  end

  def edit
    @usuarios = User.find(params[:id])
  end

  def update
    @usuarios = User.find(params[:id])
    if @usuarios.update(params_usuarios)
      redirect_to @usuarios
    else
      render 'edit'
    end
  end

  def check

  end

  private
  def params_usuarios
    params.require(:user).permit(:name, :email, :password, :admin)
  end

end
