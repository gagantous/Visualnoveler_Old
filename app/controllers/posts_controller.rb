class PostsController < ApplicationController
	

	def edit
		@post = Post.find(params[:id])
	end

	def create	
    	@post = current_user.posts.build(char_params)
    	if @post.save
    		flash[:success] = "Post created!"
    		redirect_to :back
    	else
    		flash[:success] = "Failed to create post!"
    		redirect_to :back
    	end

	end

	def destroy
		@post = Post.find(params[:id])
	  	if @post.destroy
	 		flash[:success] = "Post deleted!"
	 		redirect_to :back
	    end

	end

	def update
		@post = Post.find(params[:id])
		if @post.update(char_params)
			flash[:success] = "Your post was updated successfully!"
			redirect_to posts_path(@post)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:post).permit(:detail,:library_entry_id,:vn_id,:user_id)
		end
end
