class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :should_be_admin!

  def index
    @users = current_user.company.users
    respond_to do |format|
      format.html
      format.json { render json: {users: @users, status: 200 }, include: [:role, :company, :campaigns, :campaigns_admin, :user_creation] }
    end
  end

  def create
    @user = current_user.company.users.new(user_params)
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
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { user: @user, status: 200 }, include: [:role, :company] }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      render json: { user: @user, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.campaigns.size > 0 or @user.campaigns_admin.size > 0
      render json: { message: 'No se puede eliminar, tiene campañas asignadas', status: 500 }
    elsif @user.destroy
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  # Community Manager
  def community_managers
    @community_managers = Role.where(keyword: 'cm').first.users
    respond_to do |format|
      format.html
      format.json { render json: { community_managers: @community_managers, status: 200 } }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :username, :born_date, :company_id, :role_id)
  end
end
