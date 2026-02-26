class WishlistsController < ApplicationController

	before_action :authenticate_user!
    # def index
	#   @products = current_user.wishlist_products
	# end

	def create
	  product = Product.find(params[:product_id])

	  current_user.wishlists.find_or_create_by(product: product)

	  redirect_to product_path(product), notice: "Added to wishlist"
	end

	def destroy
	  wishlist = current_user.wishlists.find(params[:id])
	  wishlist.destroy

	  redirect_back fallback_location: root_path, notice: "Removed from wishlist"
	end

end
