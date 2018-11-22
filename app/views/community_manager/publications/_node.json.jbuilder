json.node {
  json.id node.id
  json.node_id node.node_id
  json.campaign_id node.campaign_id
  json.name node.name
  json.created_at node.created_at
  json.updated_at node.updated_at
  json.users do
    json.array! node.users.map do |user|
      json.partial! 'user', user: user
    end
  end
}
