class OrderItemsController < ApplicationController
	
	before_action :authenticate_user!
	def new 
		@order=OrderItem.new
	end

	def create
        @order=OrderItem.new(orderItem_params)
        if  @order.save
            redirect_to "/products" 
        else
            render :new
        end
    end

    private
    def orderItem_params
        params.require(:order_item).permit(:order_id,:product_id,:quantity,:unit_price)
    end

end
