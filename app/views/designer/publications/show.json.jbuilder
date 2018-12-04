json.publication {
  json.id @publication.id
  json.publication_status_id @publication.publication_status_id
  json.node_id @publication.node_id
  json.name @publication.name
  json.content @publication.content
  json.publication_date @publication.publication_date
  json.published @publication.published
  json.fb_id @publication.fb_id
  json.likes @publication.likes
  json.shares @publication.shares
  json.community_manager @publication.node.community_manager
  json.created_at @publication.created_at
  json.updated_at @publication.updated_at

  json.status @publication.status
  json.partial! 'node', node: @publication.node
  json.images do
    json.array! @publication.images.attachments.each do |image|
      json.id image.id
      json.record_type image.record_type
      json.record_id image.record_id
      json.blob_id image.blob_id
      json.created_at image.created_at
      json.name image.name
      json.filename image.filename
      json.url url_for(image)
    end
  end
}
