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

  devise_for :users

 get "/about", to: "about#index"
 get "cart/index"

 get "soaps/index"
 resources :soaps, only: [:index, :show] do
  collection do
    get "search"
  end
end

resources :categories, only: [:index, :show]
resources :cart, only: %i[create destroy]

  # /checkout/success
  # /checkout/create
  # /checkout/cancel
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  # Defines the root path route ("/")
  root to: "home#index"
end
