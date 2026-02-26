class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!

  def index
    @products = Product.avaliable_products
  end
  

# This is themethod which take input of id from admin/products.html and update the is_clearance to false and current time for deleted_at .
  def update
    @product = Product.find_by(id: params[:id])
    if @product
       @product.update(is_clearance: false, deleted_at:  DateTime.now)
       redirect_to admin_products_path , notice: "Product Delted from Ui and with date stored in database succesfully ."
     else
      redirect_to admin_products_path, notice: "Enter valid product id .  "
    end

   
   
   

  end


  def product_params   
    params.expect(product: [:id, :inventory_count, :name, :price, :deleted_at, :vendor_id])
  end
end
