class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wishlists = current_user.wishlists.includes(:product)
  end


  def create
    @wishlist = current_user.wishlists.create(
      product_id: params[:product_id])

        redirect_to wishlists_path, notice: "Added to wishlist"
  end

  def destroy
    @wishlist = current_user.wishlists.find(params[:id])
      @wishlist.destroy

       redirect_to wishlists_path, notice: "Deleted the product from wishlist"
  end


  private
  def wishlist_params
  	params.require(:wishlist).permit(:id,:product_id,:user_id)
  end

end
