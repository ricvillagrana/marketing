class Admin::CompaniesController < ApplicationController
  before_action :authenticate_user!, :should_be_admin!

  def index
    @company = current_user.company
    respond_to do |format|
      format.html
      format.json { render json: { company: @company, status: 200 }, include: [:admin, campaigns: { include: :community_manager } ] }
    end
  end

  def update
    @company = current_user.company
    pages = current_user.facebook_data[:pages]
    page = pages.map { |page| page['id'] == params[:facebook_page_id] ? page : nil}
    page.delete nil
    @company.facebook_data = page[0]
    @company.save
    if @company.update!(company_params)
      render json: { company: @company, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  private 

  def company_params
    params.require(:company).permit(:name, :description, :contact_name, :phone, :email, :address, :init_hour, :final_hour, :user_id)
  end
  
end
