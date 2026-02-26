class ProductsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  def edit
  end
 def update
  @product = Product.find(params[:id])
  
  if @product.update(product_params)
    redirect_to products_path ,notice: "Updated"
  else
    render :edit
  end
 end
private
def product_params
  params.require(:product).permit(:id,:mininventory)
end
end
