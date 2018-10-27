class Admin::CampaignsController < ApplicationController
  before_action :authenticate_user!, :should_be_admin!
  
  def index
    @companies = current_user.companies
    respond_to do |format|
      format.html
      format.json { render json: { companies: @companies, status: 200 }, include: [:admin, campaigns: { include: :community_manager }] }
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { campaign: @campaign, status: 200 }, include: [:community_manager, :company, :users] }
    end
  end

  def create
    @campaign = Company.find(params[:company_id]).campaigns.new(campaign_params)
    @campaign.semantic_network = Node.new(name: 'Red semántica')
    if @campaign.save
      render json: { campaign: @campaign, status: 200 }
    else
      render json: { error: @campaign.errors, status: 500 }
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    render json: { campaign: @campaign, status: 200 } if @campaign.update!(campaign_params)
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    if @campaign.destroy
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def all_users
    @company = Company.find(params[:company_id])
    render json: { users: @company.users, status: 200 }, include: [:roles]
  end

  def add_user
    campaign = Campaign.find(params[:campaign_id])
    user = User.find(params[:user_id])
    campaign.users.append(user) unless campaign.users.include?(user)
    if campaign.save
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def remove_user
    campaign = Campaign.find(params[:campaign_id])
    campaign.users.delete(params[:user_id]) if campaign.users.include?(User.find(params[:user_id]))
    if campaign.save
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  private

  def campaign_params
    params
      .require(:campaign)
      .permit(
        :name,
        :objetive,
        :init_date,
        :finish_date,
        :image,
        :finished,
        :deleted,
        :community_manager_id
      )
  end
end
