class ContentGenerator::PublicationsController < ApplicationController
  before_action :authenticate_user!, :should_be_content_generator!

  def index
    @user = current_user
    respond_to do |format|
      format.html
      format.json { render json: { campaigns: campaigns_with_publications(@user) } }
    end
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def campaigns_with_publications(user)
    user.campaigns.map do |campaign|
      publications = dig_publications_of(campaign.semantic_network).flatten
      publications.delete(nil)
      { data: campaign, publications: publications }
    end
  end

  def update
    @publication = Publication.find(params[:id])
    @publication.log.create!(content: @publication.content, user: current_user)
    if @publication.update!(publication_params)
      PublicationUpdateChannel.broadcast_to(@publication.id, nil)
      render json: { publication: @publication, status: 200 }, except: [:images]
    else
      render json: { errors: @publication.errors, status: 500 }
    end
  end

  def dig_publications_of(node)
    if node.children.empty?
      node.publications.map do |p|
        if p.node.users.include?(current_user)
          publication = p.as_json(include: :status, except: :images)
          publication = publication.merge(node: Node.find(p.node_id).as_json)
          publication
        end
      end
    else
      node.children.map { |child| dig_publications_of(child) }
    end
  end

  def upload_image
    publication = Publication.find(params[:publication_id])
    params[:publication][:images].each do |image|
      attachment = publication.images.new
      attachment.blob = ActiveStorage::Blob.find image[:blob][:id]
      attachment.save
    end
    PublicationUpdateChannel.broadcast_to(publication.id, nil)
    render json: { publication: publication, status: 200 }, include: [:images]
  end

  def delete_image
    publication = Publication.find(params[:publication_id])
    attachment = publication.images.attachments.find(params[:image_id])
    PublicationUpdateChannel.broadcast_to(publication.id, nil)
    render json: { status: 200 } if attachment.destroy
  end

  private

  def publication_params
    params.require(:publication).permit(:publication_status_id, :node_id, :name, :content, :publication_date, :published, :fb_id, :likes, :shares)
  end
end
