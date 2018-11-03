class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :should_be_admin!

  def index
    @companies = current_user.companies
  end

  def create
    @user = current_company.users.new(user_params)
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
      format.json { render json: { user: @user, status: 200 }, include: :roles }
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


  def current_company
    Company.find(params[:company_id])
  end

  # Roles
  def roles
    cu = CompaniesUsers.where('user_id = ? and company_id = ?', params[:user_id], params[:company_id]).first
    @roles = cu.roles
    render json: { roles: @roles, status: 500 }
  end

  def roles_append
    cu = CompaniesUsers.where('user_id = ? and company_id = ?', params[:user_id], params[:company_id]).first
    cu.roles.append(Role.find(params[:role_id]))
    if cu.save
      render json: { user: cu, status: 200 }
    end
  end

  def roles_remove
    cu = CompaniesUsers.where('user_id = ? and company_id = ?', params[:user_id], params[:company_id]).first
    cu.roles.delete(params[:role_id])
    if cu.save
      render json: { user: user, status: 500 }
    end
  end

  # Community Manager
  def community_managers
    cm_role = Role.where(keyword: 'cm').first
    @community_managers = CompaniesUsers.where(company_id: params[:company_id]).map {|user| user.roles.include?(cm_role) ? user : nil }
    @community_managers.delete nil
    respond_to do |format|
      format.html
      format.json { render json: { community_managers: @community_managers.map {|cu| cu.user}, status: 200 } }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :lastname, :email, :username, :born_date, :company_id)
  end
end
