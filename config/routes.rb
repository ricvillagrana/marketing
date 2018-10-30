Rails.application.routes.draw do
  devise_for :users
  root 'main#index'

  namespace :superadmin do
    resources :users, path: :admins
    resources :companies
  end

  namespace :admin do
    resources :companies do
      resources :campaigns, controller: 'companies/campaigns' do
        resources :publications, controller: 'companies/campaigns/publications'
      end
    end

    resources :campaigns

    get '/campaigns_users/:company_id', to: 'campaigns#all_users'
    post '/campaigns_users', to: 'campaigns#add_user'
    delete '/campaigns_users/:campaign_id/:user_id', to: 'campaigns#remove_user'

    resources :users
    get '/company/:company_id/users/:user_id/roles/', to: 'users#roles'
    put '/company/:company_id/users/:user_id/roles/append', to: 'users#roles_append'
    delete '/company/:company_id/users/:user_id/roles/remove/:role_id', to: 'users#roles_remove'

    get '/community_managers/:company_id', to: 'users#community_managers'
  end

  get '/roles', to: 'roles#index'

  # route for user profile 

  get '/profile', to: 'profile#index'
 

  get '/invited/:creation_token', to: 'invite#edit'
  put '/invited/:id', to: 'invite#update'
end
