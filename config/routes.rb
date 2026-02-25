Rails.application.routes.draw do
  namespace :admin do
    get "vendors/index"
    get "products/index"
  end
  get "vendors/index"
  get "vendors/show"
  get "orders/index"
  get "orders/show"
  get "products/index"
  get "products/show"

  devise_for :users

  root "products#index"

  resources :products
  resources :orders
  resources :order_items
  resources :reviews
  resources :wishlists
  resources :vendors
  

end
