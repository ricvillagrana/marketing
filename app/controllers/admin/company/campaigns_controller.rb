class Admin::Company::CampaignsController < ApplicationController
  before_action :authenticate_user!, :should_be_admin!

  def index
    @campaigns = current_user.company.campaigns
    render json: { campaigns: @campaigns }
  end

  def show
    @campaign = Campaign.find(params[:id])
    render json: { campaign: @campaign, status: 200 }
  end

  def create
    @campaign = current_user.company.campaigns.new(campaign_params)
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
    render json: { status: 200 } if @campaign.destroy
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
