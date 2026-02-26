class Product < ApplicationRecord
  # Associations
  belongs_to :vendor

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  has_many :reviews, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_by_users, through: :wishlists, source: :user
  # scope :check_stock, -> { where("inventory_count > ?", 10) }
  def low_stock
    inventory_count > 10
  end
end
