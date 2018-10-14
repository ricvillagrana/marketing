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
    resources :publications
    resources :campaigns
    resources :companies
  end



  get '/invited/:creation_token', to: 'invite#edit'
  put '/invited/:id', to: 'invite#update'
end
