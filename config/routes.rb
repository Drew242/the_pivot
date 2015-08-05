Rails.application.routes.draw do
  root to: "welcome#index"
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create]
  get "/cart", to: "cart_items#index"
end
