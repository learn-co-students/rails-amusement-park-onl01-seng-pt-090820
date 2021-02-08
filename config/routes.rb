Rails.application.routes.draw do
  
  resources :attractions 
  resources :rides
  resources :users
  resources :sessions
  root 'sessions#home'
  get "/signin", to: 'sessions#new'
  get "/logout", to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
