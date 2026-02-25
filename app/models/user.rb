class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum role: { customer: 0, vendor: 1, admin: 2 }

  # Associations
  has_one  :vendor, dependent: :destroy

  has_many :orders, foreign_key: :customer_id, dependent: :destroy
  has_many :reviews, foreign_key: :customer_id, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :wishlist_products, through: :wishlists, source: :product
end
