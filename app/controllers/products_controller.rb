class ProductsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def underperforming
    
    @underperforming_products = Product
                                  .left_outer_joins(:order_items) 
                                  .where(order_items: { id: nil }) 
                                  .select(:id, :name, :price, :inventory_count)
                                  .order(:name)

    # @underperforming_products ||= []
  end
  
end


























