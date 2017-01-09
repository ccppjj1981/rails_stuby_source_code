Rails.application.routes.draw do
  get 'sessions/new'

  resources :products do
    resources :likes, shallow: true
  end
  resources :users
  get '/login', to: 'sessions#new'
  root "products#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
