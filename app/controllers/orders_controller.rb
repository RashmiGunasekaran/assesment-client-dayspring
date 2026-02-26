class OrdersController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end
  def create
  @product = Product.find(1)
  @order = Order.new(order_params)
  @order.customer_id = 3
  @order.status = 1
  price = @product.price.to_f

  if order_params[:discount_id].present?
    @discount = Discount.find(order_params[:discount_id])
    discount_percent = @discount.percentage.to_f
    discount_amount = (discount_percent / 100) * price
    @order.total_price = price - discount_amount
  else
    @order.total_price = price
  end

  if @order.save
    @order.order_items.create({order_id:@order.id,product_id:@product.id,quantity:1,unit_price:price})
    redirect_to products_path, notice: "Order placed successfully"
  else
    render :new
  end
end
  def order_params
    params.expect(order: [:status,:customer_id,:total_price,:discount_id])
  end

end
