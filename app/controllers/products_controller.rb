class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!

  def index
    @products = Product.low_stock.includes(:vendor)
  end

  private

  def ensure_admin!
    redirect_to root_path, alert: "Access denied" unless current_user.admin?
  end
end