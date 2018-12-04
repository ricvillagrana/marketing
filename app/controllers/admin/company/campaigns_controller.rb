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
      cm = @campaign.community_manager

      notification = Notification.new(
        title: "Campaña #{@campaign.name} asignada",
        message: "Fuiste asignado a la campaña #{@campaign.name}",
        sender: current_user,
        reciever: cm,
        hotlink: "/#{cm.role.path_prefix}/campaigns/#{@campaign.id}",
        seen: false
      )
      notification.save
      NotificationsChannel.broadcast_to(cm.id, notification)
      render json: { campaign: @campaign, status: 200 }
    else
      render json: { error: @campaign.errors, status: 500 }
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    cm = @campaign.community_manager

    @campaign.update(campaign_params)

    if @campaign.save
      current_cm = @campaign.community_manager

      if current_cm != cm
        notification = Notification.new(
          title: "Campaña #{@campaign.name} asignada",
          message: "Fuiste asignado a la campaña #{@campaign.name}",
          sender: current_user,
          reciever: current_cm,
          hotlink: "/#{current_cm.role.path_prefix}/campaigns/#{@campaign.id}",
          seen: false
        )
        notification.save
        NotificationsChannel.broadcast_to(current_cm.id, notification)
      end
      render json: { campaign: @campaign, status: 200 }
    end
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
        :finished,
        :deleted,
        :community_manager_id
      )
  end
end
