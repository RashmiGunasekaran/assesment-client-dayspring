class VendorsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  end
