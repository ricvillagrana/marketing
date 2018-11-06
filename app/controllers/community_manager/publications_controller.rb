class CommunityManager::PublicationsController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  def index
    @user = current_user
    respond_to do |format|
      format.html
      format.json { render json: { campaigns: cmpaigns_with_publications(@user) } }
    end
  end

  def show
    @publication = Publication.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { publication: @publication, status: 200 }, include: [:status, node: { include: [users: { include: [:role] }] }] }
    end
  end

  def cmpaigns_with_publications(user)
    user.campaigns_admin.map do |campaign|
      { data: campaign, publications: dig_publications_of(campaign.semantic_network).flatten }
    end
  end

  def dig_publications_of(node)
    if node.children.empty?
      node.publications.map do |p|
        publication = p.as_json(include: :status)
        publication = publication.merge(node: Node.find(p.node_id).as_json)
        publication
      end
    else
      node.children.map { |child| dig_publications_of(child) }
    end
  end
end
