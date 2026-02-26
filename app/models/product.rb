class Product < ApplicationRecord
  # Associations
  belongs_to :vendor

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  has_many :reviews, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_by_users, through: :wishlists, source: :user


  


  def self.get_high_quantity_sell
    high_quantity_sell = OrderItem.order(quantity: :desc)
    
   return high_quantity_sell
    
  end
end
