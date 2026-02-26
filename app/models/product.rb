class Product < ApplicationRecord

  #provide visibility into products that are running low on inventory
  # a product is condidered low_stock if inventory_count < 10,
  #create an admin-facing page that lists all low_stock products 2.show product name, vendor, current
  scope :low_stock, -> { where("inventory_count < ?", 10) }
  # Associations
  belongs_to :vendor

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  has_many :reviews, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_by_users, through: :wishlists, source: :user
end


