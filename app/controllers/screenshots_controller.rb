class ScreenshotsController < ApplicationController
	def edit
		@screenshot = Screenshot.find(params[:id])
	end

	def update
		@screenshot = Screenshot.find(params[:id])
		if @screenshot.update(ss_params)
			
			flash[:success] = "Image updated sucessfully"
			redirect_to screenshot_path(@screenshot)
			#redirect_to recipe_path(@recipe)
		else
			flash[:danger] = "failed"
			render :edit
		end
	end

	def show
		@screenshot = Screenshot.find(params[:id])
	end

	def create	
    	@screenshot = Screenshot.new(ss_params) 
    	if @screenshot.save
    		 flash[:success] = "Added image successfully"
    		 redirect_to screenshot_path(@screenshot)
    	else
    		render :action=>"new"
    	end

	end

	def new
		@screenshot = Screenshot.new
	end

	private
		def ss_params
			params.require(:screenshot).permit(:name,:image,:vn_id,:alt)
		end
end
