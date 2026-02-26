class WishlistsController < ApplicationController

	before_action :authenticate_user!

	def index
  @wishlists = current_user.wishlists
end

def new
  @wishlist = current_user.wishlists.build
end

def show
  @wishlist = current_user.wishlists.find(params[:id])
end


	def create
		@wishlist = Wishlist.create(
		      user_id: params[:user_id],
		      product_id: params[:product_id])
		redirect_to wishlist_path(params[:product_id]),
                notice: "Added to wishlist"
  	end

	  def destroy
	    @wishlist = Wishlist.find(params[:id])
	    @wishlist.destroy

	    redirect_to wishlists_path,
	                notice: "Deleted the product from wishlist"
	  end





  private
  def wishlist_params
  	params.require(:wishlist).permit(:product_id,:user_id)
  end

end
