class Superadmin::UsersController < ApplicationController
  before_action :authenticate_user!, :should_be_superadmin!

  def index
    @admins = User.where.not(username: 'admin') #.map {|user| user.roles.include?(Role.where(keyword: 'admin').first) ? user : nil}
    # @admins.delete nil
    respond_to do |format|
      format.html
      format.json { render json: { admins: @admins, status: 200 }, include: [:user_creation, :company] }
    end
  end

  def create
    user_creation = UserCreation.new
    user_creation.generate_token
    @admin = User.new(user_params)
    @admin.password = user_creation.creation_token
    @admin.role = Role.where(keyword: 'admin').first
    if @admin.save
      user_creation.user = @admin
      user_creation.save
      render json: { user: @admin, link: "#{request.protocol + request.host_with_port}/invited/#{user_creation.creation_token}", status: 200 }
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
    params.require(:user).permit(:name, :lastname, :email, :username, :born_date, :company_id)
  end
end
