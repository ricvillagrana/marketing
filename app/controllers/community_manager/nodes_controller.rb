class CommunityManager::NodesController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  def show
    @node = Node.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { node: @node, statuis: 200 }, include: [:children, :campaign, :father] }
    end
  end

  def create
    @parent_node = Node.find(params[:father_id])
    @node = @parent_node.children.new(node_params)
    if @parent_node.save
      render json: { node: @node, statuis: 200 }
    else
      render json: { status: 500 }
    end
  end

  private

  def node_params
    params.require(:node).permit(:name)
  end
end
