Rails.application.routes.draw do

  devise_for :users

  root "products#index"

  resources :products
  resources :orders do
    member do
      get "cancelled_order" 
    end
  end
  resources :order_items
  resources :reviews
  resources :wishlists
  resources :vendors
  
  namespace :admin do
    resources :products, only: [:index]
    resources :vendors,  only: [:index]
  end

end
