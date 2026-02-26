class AdminController < ApplicationController
	def index
   	 admins = Admin.all
  	end
end
