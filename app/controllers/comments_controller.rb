class CommentsController < ApplicationController

	def edit
		@comment = Comment.find(params[:id])
	end

	def create	
		# if params[:comment][:post_author_id] 
		# 	flash[:success] = " I"
		# 	@comment = Comment.new(:post_author_id => params[:comment][:post_author_id],:wall_author_id => current_user)
		# else
  #   		@comment = current_user.comments.build(char_params)
  #   	end
  		@comment = current_user.comments.build(char_params)
  		@comment.wall_author_id = params[:comment][:wall_author_id]
    	if @comment.save
    		flash[:success] = "Comment created!"
    		redirect_to :back
    	else
    		flash[:success] = "Failed to create Comment!"
    		redirect_to :back
    	end

	end

	def destroy
		@comment = Comment.find(params[:id])
	  	if @comment.destroy
	 		flash[:success] = "Comment deleted!"
	 		redirect_to :back
	    end

	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(char_params)
			flash[:success] = "Your Comment was updated successfully!"
			redirect_to comments_path(@comment)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:comment).permit(:detail,:comment_author_id,:wall_author_id)
		end
end
