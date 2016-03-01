class NewsImagesController < ApplicationController

	def index
		@image = NewsImage.all
	end

	def edit
		@image = NewsImage.find(params[:id])
	end

	def create	
    	@picture = NewsImage.new(char_params)
    	if @picture.save
    		 respond_to do |format|
    		 	format.js
    		 	format.html
    		 end
    	else
    		render :action=>"new"
    	end
	end

	def destroy
		@image = NewsImage.find(params[:id])
	  	if @image.destroy
	 		flash[:success] = "Image deleted!"
	 		redirect_to :back
	    end

	end


	def update
		@news = News.find(params[:id])
		if @news.update(char_params)
			flash[:success] = "Image updated successfully!"
			redirect_to news_path(@news)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:news_image).permit(:image)
		end
end
