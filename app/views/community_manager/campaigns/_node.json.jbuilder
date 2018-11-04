json.id semantic_network.id
json.node_id semantic_network.node_id
json.campaign_id semantic_network.campaign_id
json.name semantic_network.name
json.created_at semantic_network.created_at
json.updated_at semantic_network.updated_at
json.children do
  json.array! semantic_network.children.map do |child|
    json.partial! 'node', semantic_network: child
  end
end