if @user
  json.id @user.id
  json.name @user.name
  json.created_at @user.created_at
  json.updated_at @user.updated_at
  json.campaigns do
    json.array! @user.campaigns_admin.map do |campaign|
      json.partial! 'campaign', campaign: campaign
    end
  end
end
