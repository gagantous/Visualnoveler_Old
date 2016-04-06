class TranslationPostsController < ApplicationController
	before_action :authenticate_user!, :only => [:edit,:update]
	def edit
		@post = TranslationPost.find(params[:id])
		authorize @post
	end
	def update
		@post = TranslationPost.find(params[:id])
		actual_vn_name = params[:translation_post][:actual_vn_name]
		flash_error = false
		message = "Updated TranslationPost successfully"
		if actual_vn_name.blank?
			message = "Moved TranslationPost back to pending status"
			@post.pending = true
		else
			@vn = Vn.where(name: actual_vn_name).first
			if @vn.blank?
				message = "There is no visual novel with the name of #{actual_vn_name}!"
				@post.pending = true
				flash_error = true
			else
				@post.vn_id = @vn.id
				@post.pending = false
				message = "Found #{@vn.name} and attached the translation update to it."
				if @vn.translation.blank?
					#build translation if there's no translation for a VN
					@vn.build_translation(content: "") if @vn.translation.nil?
					@vn.save
				end
			end
		end
		if @post.update(lib_params)
			if flash_error
				flash[:danger] = message
			else
				flash[:success] = message
			end
			redirect_to admin_translation_path 
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
	 		redirect_to admin_translation_path 
	    end
	end

	private

	def lib_params
			params.require(:translation_post).permit(:post,:vn_id,:pending,:pending_vn_names,:actual_vn_name)
		end
end
