class CommunityManager::NodesController < ApplicationController
  def show
    @node = Node.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { node: @node, statuis: 200 }, include: [:children, :campaign] }
    end
  end
end
