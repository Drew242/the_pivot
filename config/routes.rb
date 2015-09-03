Rails.application.routes.draw do

  root to: "welcome#index"
  resources :jobs, only: [:index]
  resources :companies, only: [:index, :show, :new, :create]

  namespace :companies, path: ':company', as: :company do
    resources :jobs, only: [:index, :show]
  end

  resources :categories, only: [:show, :index]
  resources :cart_jobs, only: [:index, :create, :destroy] do
  end

  resources :users

    namespace :companies do
      namespace :admin do
        get "/dashboard", to: "admin#index"
        get "/:company/:job/toggle_status", to: "jobs#status"
        resources :jobs
        resources :applications, only: [:index, :show]
        resources :companies
      end
    end

  resources :applications, only: [:index, :show, :create]

  get "/dashboard", to: "users#show"
  post "/dashboard", to: "addresses#create"
  get "/cart", to: "cart_jobs#index"
  get "/search", to: "search#index"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
