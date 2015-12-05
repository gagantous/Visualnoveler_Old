class FranchisesController < ApplicationController
	before_action :authenticate_user!, :only => [:edit,:new,:update]
	def show
		@franchise = Franchise.find(params[:id])
	end

	def new
		@franchise = Franchise.new
		authorize @franchise
	end

	def edit
		@franchise = Franchise.find(params[:id])
		authorize @franchise
	end

	def create	
    	@franchise = Franchise.new(char_params)  
    	if @franchise.save
    		redirect_to :back
    		flash[:success] = "Franchise successfully created!"
    	else
    		render :action=>"new"
    	end

	end

	def update
		@franchise = Franchise.find(params[:id])
		authorize @franchise
		if @franchise.update(char_params)
			flash[:success] = "Your Franchise was updated successfully!"
			redirect_to admin_franchise_path
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:franchise).permit(:name)
		end


end
