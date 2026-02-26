class Product < ApplicationRecord
# Scope to get the available products 
   scope :avaliable_products,-> { where(is_clearance: true) }




  # Associations
  belongs_to :vendor

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  has_many :reviews, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_by_users, through: :wishlists, source: :user




  

end
