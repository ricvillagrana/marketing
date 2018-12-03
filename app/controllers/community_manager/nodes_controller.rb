class CommunityManager::NodesController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  def show
    @node = Node.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { node: @node, statuis: 200 }, include: [:children, :campaign, :father, publications: { except: %i[images] }] }
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
      render json: { message: 'Tiene hijos', status: 500 }
    elsif @node.father.nil?
      render json: { message: 'Es la raíz', status: 500 }
    elsif !@node.users.empty?
      render json: { message: 'Tiene usuarios asignados', status: 500 }
    elsif !@node.publications.empty?
      render json: { message: 'Tiene publicaciones creadas', status: 500 }
    elsif @node.destroy
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def all_users
    @node = Node.find(params[:node_id])
    campaign = find_campaign_of(@node)
    users = campaign.users
    respond_to do |format|
      format.json { render json: { users: users, status: 200 }, include: [:role] }
    end
  end

  def users_in_node
    @node = Node.find(params[:node_id])
    users = @node.users
    respond_to do |format|
      format.json { render json: { users: users, status: 200 }, include: [:role] }
    end
  end

  def add_user
    @node = Node.find(params[:node_id])
    user = User.find(params[:user_id])
    if NodeUser.where('user_id = ? and node_id = ?', params[:user_id], params[:node_id]).size == 0
      if !content_generator?(@node) || user.role.keyword != 'cg'
        nu = NodeUser.new(node: @node, user: user, granter: current_user)
        if nu.save
          render json: { status: 200 }
        else
          render json: { message: 'No se pudo guardar', status: 500 }
        end
      else
        render json: { message: 'Ya existe un generador de contenido', cg: content_generator?(@node), gc_error: true, status: 500 }
      end
    else
      render json: { message: 'Ya existe el usuario en el nodo', status: 500 }
    end
  end

  def remove_user
    node_user = NodeUser.where('user_id = ? and node_id = ?', params[:user_id], params[:node_id]).first
    if !node_user.nil? && node_user.destroy
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end

  def find_campaign_of(node)
    if node.campaign_id.nil?
      find_campaign_of(node.father)
    else
      node.campaign
    end
  end

  def content_generator?(node)
    gcs = node.users.map { |u| u.role.keyword == 'cg' ? u : nil }
    gcs.delete nil
    !gcs.empty?
  end

  private

  def node_params
    params.require(:node).permit(:name)
  end
end
