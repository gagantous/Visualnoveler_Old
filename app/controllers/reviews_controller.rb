class ReviewsController < ApplicationController
	before_action :authenticate_user!, :except => [:index,:show]

	def show
		@review = Review.find(params[:id])
	end

	def new
		@vn = Vn.find(params[:vn_id])
		@review = @vn.reviews.build
		#authorize @review
	end

	def index
		@reviews = Review.limit(12).order("RANDOM()")
		
	end


	def destroy
		@review = Review.find(params[:id])
		authorize @review
	  	if @review.destroy
	 		flash[:success] = "Review deleted!"
	 		redirect_to admin_review_path
	    end

	end

	def edit
		@review = Review.find(params[:id])
		authorize @review
	end

	def create	
    	@review = Review.new(review_params)  
    	@review.user_id = params[:review][:user_id]
    	if @review.save
    		redirect_to vn_path(params[:vn_id])
    		flash[:success] = "Review successfully created!"
    	else
    		render :action=>"new"
    	end

	end

	def update
		@review = Review.find(params[:id])
		#authorize @review
		if @review.update(review_params)
			flash[:success] = "Your Review was updated successfully!"
			redirect_to vn_path(@review.vn)
		else
			render :edit
		end
	end

	private
		def review_params
			params.require(:review).permit(:details,:rating,:status,:vn_id,:user_id)
		end
end
