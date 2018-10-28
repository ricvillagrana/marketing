class CommunityManager::PublicationsController < ApplicationController
  before_action :authenticate_user!, :should_be_communty_manager!

  def index
    @user = current_user
    render json: { publications: publications_of(@user) }
  end

  def publications_of(user)
    user.campaigns_admin.map do |campaign|
      dig_publications(campaign.semantic_network)
    end
  end

  def dig_publications(node, publications = [])
    if node.children.empty?
      publications + [{publications: node.publications, of: node.name }]
    else
      node.children.map {|child| dig_publications(child) }
    end
    publications
  end
end
