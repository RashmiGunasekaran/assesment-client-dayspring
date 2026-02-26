Rails.application.routes.draw do

  devise_for :users

  root "products#index"

  resources :products
  resources :orders
  resources :order_items
  resources :reviews
  resources :wishlists
  resources :vendors
  # config/routes.rb
  
  # resources :orders, only: [:create]
  
  get "products/:id/place_order_path", to: "products#place_order", as: "place_order"

  namespace :admin do
    resources :products, only: [:index]
    resources :vendors,  only: [:index]
  end

end
