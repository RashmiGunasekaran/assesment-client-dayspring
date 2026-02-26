class VendorsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_vendor, only: [:dashboard, :show]

  def index
    @vendors = Vendor.all
  end

  def show
  end


  def dashboard
    @underperforming_products = Product
                                  .where(vendor_id: @vendor.id)  
                                  .left_outer_joins(:order_items)  
                                  .where(order_items: { id: nil })  
                                  .select(:id, :name, :price, :inventory_count)
                                  .order(:name)  
  end
  

  private

  def set_vendor
    @vendor = Vendor.find(params[:id]) 
  end

end


















class VendorsController < ApplicationController
  
end
