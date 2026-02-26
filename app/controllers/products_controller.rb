class ProductsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def place_order
    product = Product.find(params[:id])

    if product.vendor.user == current_user
      redirect_to products_path, notice: "You cannot purchase your own product"
      # return
    end

    order = current_user.orders.create!

    order.order_items.create!(product: product)

    redirect_to products_path, notice: "Order placed successfully"
  end

end