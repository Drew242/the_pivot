Rails.application.routes.draw do
  root to: "welcome#index"
  resources :items, only: [:index, :show]
  resources :categories, only: [:show, :index]
  resources :cart_items, only: [:index, :create, :destroy]
  resources :cart_items, only: [:index, :create]
  resources :users, except: [:show]
  get "/dashboard", to: "users#show"
  get "/cart", to: "cart_items#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
