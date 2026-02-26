class Admin::VendorsController < ApplicationController

  before_action :authenticate_user!
  
  def index
  end

  def top
    @vendors = Vendor.top_tier
  end

end


