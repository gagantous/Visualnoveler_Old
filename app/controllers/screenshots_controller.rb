class ScreenshotsController < ApplicationController

	def edit
		@screenshot = Screenshot.find(params[:id])
		authorize @screenshot
	end

	def update
		@screenshot = Screenshot.find(params[:id])
		authorize @screenshot
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
    		 respond_to do |format|
    		 	format.js
    		 	format.html
    		 end
    	else
    		render :action=>"new"
    	end

	end


	def destroy
		@screenshot = Screenshot.find(params[:id])
	  	if @screenshot.destroy
	 		flash[:success] = "Screenshot deleted!"
	 		redirect_to admin_screenshot_path
	    end

	end

	def new
		@screenshot = Screenshot.new
		authorize @screenshot
	end

	private
		def ss_params
			params.require(:screenshot).permit(:name,:image,:vn_id,:remote_image_url)
		end
end
