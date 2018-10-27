class CommunityManager::CampaignsController < ApplicationController

  before_action :authenticate_user!, :should_be_communty_manager!

  def index
    @campaigns = current_user.campaigns_admin
    respond_to do |format|
      format.html
      format.json { render json: { campaigns: @campaigns, status: 200 }, include: [:community_manager, :company] }
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { campaign: @campaign, status: 200 }, include: [:community_manager, :company, :users, :semantic_network] }
    end
  end

  def semantic_network
    @semantic_network = Campaign.find(params[:id]).semantic_network
  end
end
