Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'main#index'

  namespace :superadmin do
    resources :users, path: :admins
    resources :companies
  end

  namespace :admin do
    resources :users
    get '/users/:id/roles/', to: 'users#roles'
    put '/users/:id/roles/append', to: 'users#roles_append'
    delete '/users/:id/roles/remove/:role_id', to: 'users#roles_remove'
    resources :publications
    resources :campaigns
    resources :companies
  end

  get '/roles', to: 'roles#index'

  # route for user profile 

  get '/profile', to: 'profile#index'
 

  get '/invited/:creation_token', to: 'invite#edit'
  put '/invited/:id', to: 'invite#update'
end
