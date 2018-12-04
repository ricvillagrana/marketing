class CommunityManager::PublicationsController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  def index
    @user = current_user
    respond_to do |format|
      format.html
      format.json { render json: { campaigns: campaigns_with_publications(@user) } }
    end
  end

  def show
    @publication = Publication.find(params[:id])
    # respond_to do |format|
    #   format.html
    #   format.json { render json: { publication: @publication, status: 200 }, include: [:status, :images, node: { include: [users: { include: [:role] }] }] }
    # end
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update!(publication_params)
      PublicationUpdateChannel.broadcast_to(@publication.id, nil)
      render json: { publication: @publication, status: 200 }, except: %i[images]
    else
      render json: { errors: @publication.errors, status: 500 }
    end
  end

  def campaigns_with_publications(user)
    user.campaigns_admin.map do |campaign|
      { data: campaign, publications: dig_publications_of(campaign.semantic_network).flatten }
    end
  end

  def dig_publications_of(node)
    if node.children.empty?
      node.publications.map do |p|
        publication = p.as_json(include: :status, except: :images)
        publication = publication.merge(node: Node.find(p.node_id).as_json)
        publication
      end
    else
      node.children.map { |child| dig_publications_of(child) }
    end
  end

  private

  def publication_params
    params.require(:publication).permit(:publication_status_id, :node_id, :name, :content, :publication_date, :published, :fb_id, :likes, :shares)
  end
end
