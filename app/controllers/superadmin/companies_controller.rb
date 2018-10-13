class Superadmin::CompaniesController < ApplicationController  
  def index
    @companies = Company.all
    respond_to do |format|
      format.html
      format.json { render json: { companies: @companies, status: 200 }, include: :admin }
    end
  end

  def create
    @company = Company.new(company_params)
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
