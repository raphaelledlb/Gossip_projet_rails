Rails.application.routes.draw do
  get 'user/create'
  root 'gossips#index'
  get 'static_pages/team'
  get 'static_pages/contact'
  #get 'static_pages/welcome/(:first_name)', to: 'static_pages#welcome'
  #get 'static_pages/gossip_details/(:id)', to: 'static_pages#show'
  #get 'static_pages/user_details/(:id)', to: 'static_pages#user_details'
  #get 'gossip_details', to: 'gossips#show'
  resources :gossips
  resources :cities
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end