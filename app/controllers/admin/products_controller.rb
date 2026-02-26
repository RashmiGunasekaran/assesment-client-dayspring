class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!

  def index
  end
  def edit
    @product = Product.find(params[:id])
  end
  def update
    if @product.update
      redirect_to products_path
    end
    render products_path

  end
  
end
