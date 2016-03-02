class ReviewsController < ApplicationController
	before_action :authenticate_user!, :except => [:index,:show]

	def show
		@review = Review.find(params[:id])
	end

	def new
		@vn = Vn.find(params[:vn_id])
		@review = @vn.reviews.build
		@image = NewsImage.new
		#authorize @review
	end

	def index
		@reviews = Review.limit(12).order("RANDOM()")
		
	end


	def destroy
		@review = Review.find(params[:id])
		authorize @review
		vn_id = @review.vn.id
		if @review.user.mod? || @review.user.admin?
			admin_state = true
		else
			admin_state = false
		end
	  	if @review.destroy
	 		flash[:success] = "Review deleted!"
	 		if admin_state
	 			redirect_to admin_review_path
	 		else
	 			redirect_to vn_path(vn_id)
	 		end
	    end

	end

	def edit
		@review = Review.find(params[:id])
		@image = NewsImage.new
		authorize @review
	end

	def create	
    	@review = Review.new(review_params)  
    	@review.user_id = params[:review][:user_id]
    	if @review.save
    		redirect_to vn_path(params[:vn_id])
    		flash[:success] = "Review successfully created!"
    	else
    		flash[:danger] = "You cannot submit an empty review for #{@review.vn.name}"
    		redirect_to :back
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
