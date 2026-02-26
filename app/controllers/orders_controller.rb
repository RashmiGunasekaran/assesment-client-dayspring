class OrdersController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    product = Product.find(params[:product_id])
    if product.vendor.user == current_user
      redirect_to product_path(product), notice: "You cannot purchase your own product"
      # return
    end

    order = current_user.orders.create!(status: :pending)
    
    order.order_items.create!(product: product)

    redirect_to order_path(order), notice: "Order placed successfully"
  end

end
