Rails.application.routes.draw do
  get 'home/index'

  resources :variants
  get 'sessions/new'

  resources :products do
    resources :likes, shallow: true
  end
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
