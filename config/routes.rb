Rails.application.routes.draw do
  devise_for :users
  root 'main#index'

  namespace :superadmin do
    resources :users, path: :admins
    resources :companies
  end

  namespace :admin do
    get '/company', to: 'companies#index'
    put '/company', to: 'companies#update'
    namespace :company do
      resources :campaigns, controller: 'campaigns' do
        resources :publications, controller: 'campaigns/publications'
      end
    end

    resources :campaigns

    get '/campaigns_users/:company_id', to: 'campaigns#all_users'
    post '/campaigns_users', to: 'campaigns#add_user'
    delete '/campaigns_users/:campaign_id/:user_id', to: 'campaigns#remove_user'

    resources :users

    get '/community_managers/:company_id', to: 'users#community_managers'
  end

  namespace :community_manager do
    resources :campaigns 
    resources :nodes, only: %i[show create update destroy] do
      resources :publications, controller: 'nodes/publications'
    end

    resources :publications do
      resources :tasks, only: %i[show create update destroy], controller: 'publications/tasks'
    end

    get '/users_in_node/:node_id', to: 'nodes#users_in_node'

    get '/nodes_users/:node_id', to: 'nodes#all_users'
    post '/nodes_users', to: 'nodes#add_user'
    delete '/nodes_users/:node_id/:user_id', to: 'nodes#remove_user'

    get '/campaigns/semantic_network/:id', to: 'campaigns#semantic_network'
  end

  get '/roles', to: 'roles#index'

  # Route for user profile
  get '/profile', to: 'profile#index'

  get '/invited/:creation_token', to: 'invite#edit'
  put '/invited/:id', to: 'invite#update'
end
