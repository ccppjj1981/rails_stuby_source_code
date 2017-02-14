Rails.application.routes.draw do
  get 'home/index'
  resources :tickets
  resources :variants
  get 'sessions/new'
  #get 'cart/index'
  #get 'carts/:id',to: 'cart#index',as: 'cart'
  resource :cart
  resources :orders
  resources :products do
    resources :likes, shallow: true
  end
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root "home#index"
  namespace :api do
    resources :line_items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
