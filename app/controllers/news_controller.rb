class NewsController < ApplicationController
	before_action :authenticate_user!, :except => [:index,:show]
	include ApplicationHelper
	def index
		@news = News.paginate(:page => params[:page], :per_page => 3).order("created_at desc")
	end

	def show
		@news = News.find(params[:id])
		# @tags = @news.
		@related = @news.find_related_tags.limit(3).order("RANDOM()")
		@news_description = ActionView::Base.full_sanitizer.sanitize(markdown(@news.content)).truncate(200).gsub("\n", ' ').squeeze(' ').html_safe
		if @related.blank?
			@random = true
			@related = News.limit(3).order("RANDOM()")
		end
	end

	def new
		@news = News.new
		@image = NewsImage.new
		authorize @news
	end
	def edit
		@news = News.find(params[:id])
		@image = NewsImage.new
		authorize @news
	end

	def create	
    	@news = current_user.news.build(char_params)
    	authorize @news
    	if @news.save
    		flash[:success] = "News created!"
    		redirect_to news_path(@news)
    	else
    		flash[:success] = "Failed to create News"
    		redirect_to :back
    	end

	end

	def destroy
		@news = News.find(params[:id])
		authorize @news
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
			params.require(:news).permit(:title,:content,:user_id,:news_image_id,:featured_image,:tag_list)
		end
end
