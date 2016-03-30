class TranslationPostsController < ApplicationController
	before_action :authenticate_user!, :only => [:edit,:update]
	def edit
		@post = TranslationPost.find(params[:id])
		authorize @post
	end
	def update
		@post = TranslationPost.find(params[:id])
		if @post.update(lib_params)
		           
			flash[:success] = "TranslationPost is updated successfully!"
			redirect_to library_user_path(@post.user)  
		else
			flash[:danger] = "Failed to update TranslationPost"
			redirect_to session[:previous_url] 
		end
	end
	def destroy
		@post = TranslationPost.find(params[:id])
		authorize @post
	  	if @post.destroy
	 		flash[:success] = "Removed translation post entry"
	 		redirect_to :back
	    end
	end

	private

	def lib_params
			params.require(:library_entry).permit(:status,:vn_id,:user_id,:name,:favourite,:notes,:id)
		end
end
