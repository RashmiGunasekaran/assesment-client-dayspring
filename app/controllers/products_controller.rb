class ProductsController < ApplicationController

  before_action :authenticate_user!
  
  def index

    @products = Product.all
    @high_sell_products = Product.get_high_quantity_sell




    
  end

  def show
    @product = Product.find(params[:id])
  end


end
