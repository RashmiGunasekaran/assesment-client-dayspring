class Order < ApplicationRecord
  enum :status, { pending: 0, completed: 1, cancelled: 2 }

  # Associations
  belongs_to :customer, class_name: "User"

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  def valid_user(customer , order )
    order_ids =customer.orders.pluck(:id)
    order_ids.each do |order_id|
      puts "#{order} , #{order_id}"
      if(order.id == order_id) 
        #puts " return true "
        return true
      end
    end
    # puts "return false"
     false
  end
end
