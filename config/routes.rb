Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users
  root 'main#index'

  get '/chat/users', to: 'chat#users'
  post '/chat/conversation', to: 'chat#find_or_create_conversation'
  post '/chat/message', to: 'chat#send_message'


  get '/publication_messages/:publication_id', to: 'main#publication_messages'
  post '/publication_messages', to: 'main#send_message'

  get '/notifications', to: 'profile#notifications'
  put '/notifications/see', to: 'profile#see_notifications'

  get '/current_user', to: 'profile#user'

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

    get '/facebook/auth', to: 'facebook#auth'
    get '/facebook/code_callback', to: 'facebook#code_callback'
    get '/facebook/access_token_callback', to: 'facebook#access_token_allback'
    get '/facebook/data', to: 'facebook#data'
  end

  namespace :community_manager do
    resources :campaigns
    resources :nodes, only: %i[show create update destroy] do
      resources :publications, controller: 'nodes/publications'
    end

    resources :publications do
      resources :tasks, only: %i[show create update destroy], controller: 'publications/tasks'
    end

    # get '/users_in_node/:node_id', to: 'nodes#users_in_node'

    get '/campaign_users/:node_id', to: 'nodes#all_users'
    get '/nodes_users/:node_id', to: 'nodes#users_in_node'
    post '/nodes_users', to: 'nodes#add_user'
    delete '/nodes_users/:node_id/:user_id', to: 'nodes#remove_user'

    get '/campaigns/semantic_network/:id', to: 'campaigns#semantic_network'

    get '/facebook/auth', to: 'facebook#auth'
    get '/facebook/code_callback', to: 'facebook#code_callback'
    get '/facebook/access_token_callback', to: 'facebook#access_token_allback'
    get '/facebook/data', to: 'facebook#data'
    post '/facebook/post', to: 'facebook#post'
    post '/facebook/albums', to: 'facebook#album'
    post '/facebook/albums/photos', to: 'facebook#upload_photos'
  end

  namespace :designer do
    resources :publications
    put '/upload/:publication_id', to: 'publications#upload_image'
    delete '/upload/:publication_id/:image_id', to: 'publications#delete_image'
  end

  namespace :content_generator do
    resources :publications
    put '/upload/:publication_id', to: 'publications#upload_image'
    delete '/upload/:publication_id/:image_id', to: 'publications#delete_image'
  end

  # Global routes | requires auth

  get '/roles', to: 'roles#index'
  get '/profile', to: 'profile#index'

  # Global routes | no requires auth

  get '/invited/:creation_token', to: 'invite#edit'
  put '/invited/:id', to: 'invite#update'
end
