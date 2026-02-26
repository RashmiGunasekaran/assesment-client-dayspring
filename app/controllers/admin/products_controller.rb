class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.low_stock.includes(:vendor)
  end
end