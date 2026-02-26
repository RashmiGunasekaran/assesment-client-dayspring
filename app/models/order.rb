class Order < ApplicationRecord
  enum :status, { pending: 0, completed: 1, cancelled: 2 }

  # Associations
  belongs_to :customer, class_name: "User"

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  def vendor_cannot_buy_own_product
    return unless order.customer && product.vendor

    if product.vendor.user_id == order.customer_id
      errors.add(:product, "cannot purchase own product")
    end
  end
n
end

