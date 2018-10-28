class CommunityManager::Nodes::PublicationsController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  def index
    @node = Node.find(params[:node_id])
    respond_to do |format|
      format.html
      format.json { render json: { node: @node }, include: [:publications, :children] }
    end
  end

end
