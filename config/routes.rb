Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  root "welcome#home"

  get '/signin', to: "sessions#signin"
  post '/signin', to: "sessions#create", as: "create_signin"
  post '/logout', to: "sessions#logout", as: "logout"
  post '/ride/:id', to: "rides#go_on_ride", as: "ride"
end
