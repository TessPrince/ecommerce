Rails.application.routes.draw do
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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
