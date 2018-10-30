class Superadmin::CompaniesController < ApplicationController
  before_action :authenticate_user!
  def index
    @companies = Company.all
    respond_to do |format|
      format.html
      format.json { render json: { companies: @companies, status: 200 }, include: :admin }
    end
  end

  def create
    @company = Company.new(company_params)
    @company.users.append(User.find(params[:user_id]))
    @company.save
    @company.companies_user.where(user_id: params[:user_id]).first.roles.append(Role.where(keyword: 'admin').first)
    if @company.save
      render json: { company: @company, status: 200 }
    else
      render json: { errors: @company.errors, status: 500 }
    end
  end

  def show
    @company = Company.find(params[:id])
    if @company
      render json: { company: @company, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def update
    @company = Company.find(params[:id])
    @company.users.append(User.find(params[:user_id]))
    user = @company.companies_user.where(user_id: params[:user_id]).first
    unless user.roles.include?(Role.where(keyword: 'admin').first)
      user.roles.append(Role.where(keyword: 'admin').first)
    end
    @company.save
    if @company.update!(company_params)
      render json: { company: @company, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  private 

  def company_params
    params.require(:company).permit(:name, :description, :contact_name, :phone, :email, :address, :init_hour, :final_hour, :user_id)
  end
  
end
