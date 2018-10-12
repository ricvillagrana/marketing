class Superadmin::UsersController < ApplicationController

  def index
    @admins = Role.where(keyword: 'admin').first.users
    respond_to do |format|
      format.html
      format.json { render json: { admins: @admins, status: 200 } }
    end
  end

  def create
    user_creation = UserCreation.new
    user_creation.generate_token
    @admin = User.new(email: params[:email], password: user_creation.creation_token)
    @admin.roles.append(Role.where(keyword: 'admin'))
    if @admin.save
      user_creation.user = @admin
      user_creation.save
      render json: { user: @admin, link: "#{request.protocol + request.host}/invited/#{user_creation.creation_token}", status: 200 }
    else
      render json: { errors: @admin.errors, status: 500 }
    end
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

  def destroy
    @admin = User.find(params[:id])
    if @admin.destroy
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :username, :born_date)
  end
end
