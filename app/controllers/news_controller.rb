class NewsController < ApplicationController
	def index
		@news = News.all
	end

	def show
		@news = News.find(params[:id])
	end
	def new
		@news = News.new
		@image = NewsImage.new
	end
	def edit
		@news = News.find(params[:id])
		@image = NewsImage.new
	end

	def create	
    	@news = current_user.news.build(char_params)
    	if @news.save
    		flash[:success] = "News created!"
    		redirect_to :back
    	else
    		flash[:success] = "Failed to create News"
    		redirect_to :back
    	end

	end

	def destroy
		@news = News.find(params[:id])
	  	if @news.destroy
	 		flash[:success] = "News deleted!"
	 		redirect_to :back
	    end

	end


	def update
		@news = News.find(params[:id])
		if @news.update(char_params)
			flash[:success] = "Your News was updated successfully!"
			redirect_to news_path(@news)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:news).permit(:title,:content,:user_id,:news_image_id)
		end
end
