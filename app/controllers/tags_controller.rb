class TagsController < ApplicationController
	def index
		@tags = ActsAsTaggableOn::Tag.all
 	end

  	def show
    	@tag =  ActsAsTaggableOn::Tag.find(params[:id])
    	@news = News.tagged_with(@tag.name).order("created_at desc").paginate(:page => params[:page], :per_page => 7)
  	end
end
