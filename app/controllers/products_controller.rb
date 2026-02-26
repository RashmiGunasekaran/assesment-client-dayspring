class ProductsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @products = Product.avaliable_products
  end

  def show
    @product = Product.find(params[:id])
  end

end
