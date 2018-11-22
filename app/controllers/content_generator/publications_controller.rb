class ContentGenerator::PublicationsController < ApplicationController
  before_action :authenticate_user!, :should_be_content_generator!

  def index
    @user = current_user
    respond_to do |format|
      format.html
      format.json { render json: { campaigns: cmpaigns_with_publications(@user) } }
    end
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def cmpaigns_with_publications(user)
    user.campaigns.map do |campaign|
      { data: campaign, publications: dig_publications_of(campaign.semantic_network).flatten }
    end
  end

  def update
    @publication = Publication.find(params[:id])
    @publication.log.create!(content: @publication.content, user: current_user)
    if @publication.update!(publication_params)
      render json: { publication: @publication, status: 200 }
    else
      render json: { errors: @publication.errors, status: 500 }
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

  def upload_image
    publication = Publication.find(params[:publication_id])
    params[:publication][:images].each do |image|
      attachment = publication.images.new
      attachment.blob = ActiveStorage::Blob.find image[:blob][:id]
      attachment.save
    end
    render json: { publication: publication, status: 200 }, include: [:images]
  end

  def delete_image
    publication = Publication.find(params[:publication_id])
    attachment = publication.images.attachments.find(params[:image_id])
    render json: { status: 200 } if attachment.destroy
  end

  private

  def publication_params
    params.require(:publication).permit(:publication_status_id, :node_id, :name, :content, :publication_date, :published, :fb_id, :likes, :shares)
  end
end
