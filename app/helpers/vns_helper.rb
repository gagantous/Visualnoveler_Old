module VnsHelper
	#helper method to make ratings

	def rate_vn(rating)
		types =[10,8,6,4] #Perfect, Great, Good, Awful
		min_ratings_required = 20 #min number of ratings required before ratings update
		@vn = Vn.find(params[:id])
		libentry = current_user.library_entries.find_or_create_by(vn_id: @vn.id)
		case rating
			when 10
				rating_type = "Perfect"
			when 8
				rating_type = "Great"
			when 6
				rating_type = "Good"
			when 4
				rating_type = "Awful"
		end
			if libentry.rating != rating
				if @vn.rating_number.blank?
					@vn.rating_number = 5 #set default rating to 5 if somehow rating ended up to be empty
				end
				#update attributes before calculating all scores
				libentry.update_attribute(:rating,rating)
				libentry.save
				#get all score counts
				score_perfect = @vn.library_entries.where(rating:10).count
				score_great = @vn.library_entries.where(rating:8).count
				score_good = @vn.library_entries.where(rating:6).count 
				score_awful = @vn.library_entries.where(rating:4).count
				message = "Successfully rated #{@vn.name} as #{rating_type}"
				warning_text = " but value will only update if there are at least #{min_ratings_required} ratings"
				if score_perfect + score_great + score_good + score_awful > min_ratings_required
					@vn.rating_number = ((score_perfect * 10.0 + score_great * 8.0 + score_good * 6.0 + score_awful*4) / (score_perfect + score_great + score_good + score_awful))
					@vn.save
					warning_text = ""
				end
		
				redirect_to :back
				flash[:success] = message + warning_text
			
			else #if already have same type of ratings, redirect and inform user
			
				flash[:danger] = "You have already rated #{@vn.name} as #{rating_type}"
				redirect_to :back
			end
	end

end
