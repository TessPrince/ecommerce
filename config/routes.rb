Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'categories/index'
  get 'categories/show'
  get 'order_details/index'
  get 'order_details/show'
  get 'orders/index'
  get 'orders/show'
  get 'customers/index'
  get 'customers/show'
  get 'soaps/index'
  get 'soaps/show'

 get "/about", to: "about#index"

 get "soaps/index"
 resources :soaps, only: [:index, :show] do
  collection do
    get "search"
  end
end

resources :categories, only: [:index, :show]

  # Defines the root path route ("/")
  root to: "home#index"
end
