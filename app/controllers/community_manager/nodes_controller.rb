class CommunityManager::NodesController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  def show
    @node = Node.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { node: @node, statuis: 200 }, include: [:children, :campaign, :father, :publications] }
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

  def update
    @node = Node.find(params[:id])
    if @node.update!(node_params)
      render json: { node: @node, status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def destroy
    @node = Node.find(params[:id])
    if !@node.children.empty?
      render json: { message: 'No se puede eliminar, tiene hijos', status: 500 }
    elsif @node.father.nil?
      render json: { message: 'No se puede eliminar, es la raíz', status: 500 }
    elsif @node.destroy
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  private

  def node_params
    params.require(:node).permit(:name)
  end
end
