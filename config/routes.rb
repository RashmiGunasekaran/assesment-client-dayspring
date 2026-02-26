Rails.application.routes.draw do

  devise_for :users

  root "products#index"

  resources :products
  resources :orders
  resources :order_items
  resources :reviews
  resources :wishlists
  resources :vendors
  
  namespace :admin do
    resources :products, only: [:index]
    resources :vendors,  only: [:index]
  end

  resources :product do
  resources :reviews, only: [:create]
  end

end







<!-- app/views/reviews/_form.html.erb -->
<%= form_with(model: @review) do |f| %>
  <div>
    <%= f.label :rating, "Star Rating (1-5)" %>
    <%= f.number_field :rating, in: 1..5 %>
  </div>

  <div>
    <%= f.label :comment, "Optional Comment" %>
    <%= f.text_area :comment, placeholder: "Write something (optional)" %>
  </div>

  <div>
    <%= f.submit "Submit Review" %>
  </div>
<% end %>
