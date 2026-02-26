Rails.application.routes.draw do

  devise_for :users

  root "products#index"

  resources :products
  resources :orders 
   get 'create_order/:product_id',to:"orders#create_order",as:"create_order"
  resources :order_items
  resources :reviews
  resources :wishlists
  resources :vendors
  
  namespace :admin do
    resources :products, only: [:index]
    resources :vendors,  only: [:index]
  end

end
