class ReviewsController < ApplicationController
	before_action :authenticate_user!

	before_action :set_product, only: [:show, :edit, :update, :destroy]

	def index
		@review = @product.all
	end

	def new
		@review = @product.new
	end

	def show
		@review = Review.find(params[:id])
		@status = case @review.rating - 5
            when 0 then "Excellent"
            when -1, -2 then "Good"
            else "better"
        end 
	end

	def edit

	end



    def create
     @review = Review.new(review_params)
  
     if @review.save
     if @review.comment.present?
      puts "User add a comment: #{@review.comment}"
     else
      puts "any comment"
     end
      redirect_to @review, notice: "Review submitted successfully."
     else
      render :new
     end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end



