class PublishersController < ApplicationController
	before_action :authenticate_user!, :only => [:edit,:new,:update]
	def show
		@publisher = Publisher.find(params[:id])
	end

	def new
		@publisher = Publisher.new
		authorize @publisher
	end

	def index
		@publishers = Publisher.limit(14).order("RANDOM()")
	end

	def edit
		@publisher = Publisher.find(params[:id])
		authorize @publisher
	end

	def create	
    	@publisher = Publisher.new(char_params)  
    	if @publisher.save
    		redirect_to publisher_path(@publisher)
    		flash[:success] = "Publisher successfully created!"
    	else
    		render :action=>"new"
    	end

	end

	def update
		@publisher = Publisher.find(params[:id])
		authorize @publisher
		if @publisher.update(char_params)
			flash[:success] = "Your Publisher was updated successfully!"
			redirect_to admin_publisher_path(@publisher)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:publisher).permit(:name,:details)
		end

end
