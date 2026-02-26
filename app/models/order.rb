class Order < ApplicationRecord
  enum :status, { pending: 0, completed: 1, cancelled: 2 }

  # Associations
  belongs_to :customer, class_name: "User"

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

end


























