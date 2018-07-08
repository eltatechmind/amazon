Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'users#index'
  post '/addcart', to: 'users#addcart'
  post '/removecart', to: 'users#removecart'
  post '/addorder', to: 'users#addorder'
  post 'cancelorder', to: 'users#cancelorder'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/categories', to: 'users#index'
  get '/cart', to: 'users#cart'
  get '/order', to: 'users#order'
  get '/cancelled', to: 'users#cancelled'
  get '/completed', to: 'users#completed'


  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/createaddress', to: 'addresses#new'
  post '/createaddress', to: 'addresses#create'
  post '/deleteaddress', to: 'addresses#delete'
  get '/chooseaddress', to: 'addresses#choose'

  resources :users
  resources :photos
  resources :categories
  resources :items
  resources :account_activations, only: [:edit]
  resources :addresses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

