class Superadmin::UsersController < ApplicationController

  def index
    @admins = Role.where(keyword: 'admin').first.users
  end

  def show
    @admin = User.find(params[:id])
    if @admin
      render json: { user: @admin, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def update
    @admin = User.find(params[:id])
    if @admin.update!(user_params)
      render json: { user: @admin, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :username, :birthday)
  end
end
