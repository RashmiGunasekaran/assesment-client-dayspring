class OrdersController < ApplicationController

  before_action :authenticate_user!
  
  def index
    #raise params.inspect
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  def cancelled_order
    #raise params.inspect
    # @customer =User.find(params[:customer_id])
    @customer =current_user
    @order =Order.find(params[:id])
    # if @order.valid_user(@customer,@order)
    #     @order.status = "cancelled"
    #     if @order.save
    #       puts "your order is cancelled.."
    #       redirect_to orders_path(@order),notice: "your order is cancelled.."
    #     else  
    #       puts "try it again"
    #       redirect_to orders_path(@order),notice: "try it again"
    #     end
    # else 
    #   puts "not a valid order"
    #   redirect_to orders_path(@order),notice: "not a valid order"
    # end
    if current_user.id == @order.customer_id
      @order.status = "cancelled"
        if @order.save
          # puts "your order is cancelled.."
          # flash.now(" your ourder is cancelled")
          redirect_to orders_path(@order), notice: "your order is cancelled.."
        else  
          # puts "try it again"
          # flash.now(" hgg hjg")
          redirect_to orders_path(@order), notice: "try it again"
        end
    else
      #  puts "not a valid order"
      redirect_to orders_path(@order), notice: "not a valid order"
    end
  end

  private
  def order_params
    params.expect(order: [:status, :customer_id ,:total_price])
  end
end
