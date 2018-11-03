# { companies: @companies, status: 200 }, include:  [users: { include: [:user_creation, :campaigns, :campaigns_admin, companies_user: { include: [:roles], where }] } ]
json.companies @companies do |company|
  json.id company.id
  json.user_id company.user_id
  json.name company.name
  json.description company.description
  json.contact_name company.contact_name
  json.phone company.phone
  json.email company.email
  json.address company.address
  json.init_hour company.init_hour
  json.final_hour company.final_hour
  json.fb_id company.fb_id
  json.fb_access_token company.fb_access_token
  json.deleted company.deleted
  json.created_at company.created_at
  json.updated_at company.updated_at
  json.users company.users do |user|
    json.born_date user.born_date
    json.company_id user.company_id
    json.created_at user.created_at
    json.deleted user.deleted
    json.email user.email
    json.fb_id user.fb_id
    json.fb_image user.fb_image
    json.fb_name user.fb_name
    json.id user.id
    json.image user.image
    json.lastname user.lastname
    json.name user.name
    json.updated_at user.updated_at
    json.username user.username

    json.campaigns user.campaigns
    json.campaigns_admin user.campaigns_admin
    cu = user.companies_user.where(company_id: company.id).first
    json.companies_user do
      json.id cu.id
      json.user_id cu.user_id
      json.company_id cu.company_id
      json.created_at cu.created_at
      json.updated_at cu.updated_at
      json.roles cu.roles
    end
  end
end
