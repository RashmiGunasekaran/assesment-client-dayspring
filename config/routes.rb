Rails.application.routes.draw do

  devise_for :users

  root "products#index"

  resources :products
  resources :orders
  resources :order_items
  resources :reviews
  # resources :wishlists
  resources :vendors
  
  namespace :admin do
    resources :products, only: [:index]
    resources :vendors,  only: [:index]
  end

  resources :products, only: [:index, :show] do
   resource :wishlist, only: [:create, :destroy]
  end

end
