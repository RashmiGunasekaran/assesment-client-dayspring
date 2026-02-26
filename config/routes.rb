Rails.application.routes.draw do

  devise_for :users


  resources :products
  resources :orders
  resources :order_items
  resources :reviews
  resources :wishlists
  resources :vendors
  
  namespace :admin do
    resources :products, only: [:index]
    resources :vendors,  only: [:index] do
      collection do
        get :top
      end
    end
  end

end

