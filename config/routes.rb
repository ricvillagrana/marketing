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

    resources :users
    get '/users/:id/roles/', to: 'users#roles'
    put '/users/:id/roles/append', to: 'users#roles_append'
    delete '/users/:id/roles/remove/:role_id', to: 'users#roles_remove'

    get '/community_managers', to: 'users#community_managers'
  end

  get '/roles', to: 'roles#index'


  get '/invited/:creation_token', to: 'invite#edit'
  put '/invited/:id', to: 'invite#update'
end
