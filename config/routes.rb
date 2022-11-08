Rails.application.routes.draw do
  get 'customers/index'
  get 'customers/show'
  get 'soaps/index'
  get 'soaps/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
