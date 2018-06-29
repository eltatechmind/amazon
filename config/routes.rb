Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'sessions/new'

  root 'users#tempo'
  post '/addcart', to: 'users#addcart'
  post '/removecart', to: 'users#removecart'
  post '/addorder', to: 'users#addorder'
  post 'cancelorder', to: 'users#cancelorder'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'	
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/categories', to: 'users#index'
  get '/cart', to: 'users#cart'
  get '/order', to: 'users#order'
  resources :users
  resources :photos
  resources :categories
  resources :items
  resources :account_activations, only: [:edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
