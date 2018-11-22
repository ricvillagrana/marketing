class CommunityManager::Nodes::PublicationsController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  def index
    @node = Node.find(params[:node_id])
    respond_to do |format|
      format.html
      format.json { render json: { node: @node }, include: %i[publications children] }
    end
  end

  def create
    @publication = Node.find(params[:node_id]).publications.new(node_params)
    @publication.status = PublicationStatus.first
    if @publication.save
      render json: { publication: @publication, status: 200 }
    else
      render json: { errors: @publication.errors, status: 500 }
    end
  end

  private

  def node_params
    params.require(:publication).permit(:node_id, :content, :name)
  end
end
