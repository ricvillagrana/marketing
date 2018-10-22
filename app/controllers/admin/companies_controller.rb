class Admin::CompaniesController < ApplicationController  
  def index
    @companies = current_user.companies
    respond_to do |format|
      format.html
      format.json { render json: { companies: @companies, status: 200 }, include: :admin }
    end
  end

  def create
    @company = current_user.companies.new(company_params)
    if @company.save
      render json: { company: @company, status: 200 }
    else
      render json: { errors: @company.errors, status: 500 }
    end
  end

  def show
    @company = current_user.companies.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { company: @company, status: 200 }, include: [:admin, campaigns: { include: :community_manager } ] }
    end
  end

  def update
    @company = current_user.companies.find(params[:id])
    if @company.update!(company_params)
      render json: { company: @company, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def destroy
    @company = current_user.companies.find(params[:id])
    if @company.campaigns.size > 0
      render json: { message: 'No se puede eliminar, tiene campañas asignadas', status: 500 }
    elsif @company.destroy
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
