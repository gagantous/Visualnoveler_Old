module VnsHelper
	#helper method to make ratings
	def rate_vn(rating)
		types =[10,8,6,4]
		@vn = Vn.find(params[:id])
		libentry = current_user.library_entries.find_or_create_by(vn_id: @vn.id)
			if libentry.rating != rating
				libentry.update_attribute(:rating,rating)
				#logic for rating update
					@vn.rating_number = @vn.rating_number + 0.2
				elsif rating == 8
					@vn.rating_number = @vn.rating_number + 0.1
				elsif rating == 6
					@vn.rating_number = @vn.rating_number + 0.05
				elsif rating == 4
					@vn.rating_number = @vn.rating_number - 0.3
				else
					flash[:danger] = "Invalid rating specified, did you try to break things?"
				end
				@vn.save
				redirect_to :back
				flash[:success] = "Successfully rated #{@vn.name}"
			
			else
				flash[:danger] = "You have already rated #{@vn.name} as Perfect!"
				redirect_to :back
	end


	## add ratings to vn, you can optimize this next time, does 2 vn find queries 
	def rating_number(number)

		@vn = Vn.find(params[:id])
		@vn.rating_number = @vn.rating_number + 0.2
	end
end
