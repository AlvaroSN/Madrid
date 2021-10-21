class AdminsController < ApplicationController

  def index

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

  private
  def params_usuarios
    params.require(:user).permit(:email, :password, :name, :admin, :password_confirmation, :current_password)
  end

end
