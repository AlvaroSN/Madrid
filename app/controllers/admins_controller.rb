class AdminsController < ApplicationController

  def index
    @usuarios = User.all
  end

  def new
    @usuarios = User.new
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
    puts('----------------Función edit------------------')
    @usuarios = User.find(params[:id])

  end

  def update
    puts('----------------Función update-----------------')
    @usuarios = User.find(params[:id])
    @usuarios.update(params_usuarios)
    redirect_to admins_path
  end

  def check
    @usuario = User.find(params[:user])
    @usuario.admin = params[:admin]
    @usuario.save!
  end

  private
  def params_usuarios
    params.require(:user).permit(:name, :email, :admin)
  end

end
