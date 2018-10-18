class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = current_user.users
    respond_to do |format|
      format.html
      format.json { render json: { users: @users, status: 200 }, include: :roles }
    end
  end

  def create
    @user = current_user.users.new(user_params)
    user_creation = UserCreation.new
    user_creation.generate_token
    @user.password = user_creation.creation_token
    if @user.save
      user_creation.user = @user
      user_creation.save
      render json: { user: @user, link: "#{request.protocol + request.host_with_port}/invited/#{user_creation.creation_token}", status: 200 }
    else
      render json: { errors: @user.errors, status: 500 }
    end
  end

  def show
    @user = current_user.users.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { user: @user, status: 200 }, include: :roles }
    end
  end

  def update
    @user = current_user.users.find(params[:id])
    if @user.update!(user_params)
      render json: { user: @user, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def destroy
    @user = current_user.users.find(params[:id])
    if @user.destroy
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def roles
    user = User.find(params[:id])
    @roles = user.roles
    render json: { roles: @roles, status: 500 }
  end

  def roles_append
    user = User.find(params[:id])
    user.roles.append(Role.find(params[:role_id]))
    user.save
    render json: { user: user, status: 500 }
  end

  def roles_remove

    user = User.find(params[:id])
    user.roles.delete(params[:role_id])
    user.save
    render json: { user: user, status: 500 }
  end

  private

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :username, :born_date)
  end
end
