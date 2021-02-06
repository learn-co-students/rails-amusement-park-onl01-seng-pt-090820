Rails.application.routes.draw do
  resources :attractions
  resources :rides
  resources :users
  root 'users#new'
  get "/signin", to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
