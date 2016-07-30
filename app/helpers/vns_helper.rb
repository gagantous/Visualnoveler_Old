module VnsHelper
	#helper method to make ratings
	def get_status(string) 
		case string
			when "Not Translated"
				return 0
			when "Translated"
				return 1
			when "Ongoing Translation"
				return 2
			when "OELVN"
				return 3
		end
		return 
	end

	def rating_string(rating)
		string = ""
		case rating
			when 10
				string = "Perfect"
			when 9
				string = "Great"
			when 8
				string = "Very Good"
			when 7
				string = "Good"
			when 6
				string = "Fine"
			when 5
				string = "Average"
			when 4
				string = "Bad"
			when 3
				string = "Very Bad"
			when 2
				string = "Horrible"
			when 1
				string = "Waste of time"
		end
		return string
	end
	def get_review_icon(rating)
		
		rating = rating.to_f
		text = ""
		
		if rating == 5
			text = '<span class="vn-recommendtext summarytext">Mixed Thoughts</span>'
			return  '<i class="fa fa-question" style="color:#F89406;padding-right:5px;font-size:2.9em;"></i>'.html_safe + text.html_safe
		elsif rating > 5
			text = '<span class="vn-recommendtext summarytext">Recommended</span>'
			return '<i class="fa fa-smile-o fa-3x" style="color:green;padding-right:8px;"></i>'.html_safe + text.html_safe
		elsif rating < 5
			text = '<span class="vn-recommendtext summarytext">Not Recommended</span>'
			return '<i class="fa fa-frown-o fa-3x" style="color:#F64747;padding-right:5px;"></i>'.html_safe + text.html_safe
		end
	end

	def get_purchase_location(url)
		if url.blank?
			return
		end
		if url.include?("steampowered")
			link_to(url,:rel =>"nofollow",:target =>"_blank") do
				'<i class="fa fa-steam-square vn-purchaseicon" style="font-size:1.9em;color:black;position:relative;top:3px;padding-left:5px;padding-right:5px;"></i>'.html_safe
			end			
		elsif url.include?("mangagamer")
			return link_to(image_tag("mg_logo.png",alt:"mangagamer logo",style:"position:relative;bottom:1px;padding-left:5px;padding-right:5px;"),url,:rel => "nofollow",:target =>"_blank").html_safe
		elsif url.include?("jlist")
			return link_to(' J-List',url,:rel => "nofollow",:target =>"_blank",style:"padding-left:5px;padding-right:5px;".html_safe)
		elsif url.include?("jastusa")
			return link_to(' JAST',url,:rel => "nofollow",:target =>"_blank",style:"padding-left:5px;padding-right:5px;".html_safe)
		else 
			link_to(url,:rel =>"nofollow",:target =>"_blank") do
				'<i class="fa fa-external-link vn-purchaseicon" style="font-size:1.25em;color:black;position:relative;top:3px;padding-left:5px;padding-right:5px;"></i>'.html_safe
			end	
		end
	end

	def rate_vn(rating)
		min_ratings_required = 25 #min number of ratings required before ratings update
		avg_total_number = 0.0
		avg_count = 0.0 
		@vn = Vn.find(params[:id])
		libentry = current_user.library_entries.find_or_create_by(vn_id: @vn.id)
			if libentry.rating != rating.to_i
				if @vn.rating_number.blank?
					@vn.rating_number = 5 #set default rating to 5 if somehow rating ended up to be empty
				end
				#update attributes before calculating all scores
				libentry.update_attribute(:rating,rating)
				libentry.save
				#get all score counts
				# score_perfect = @vn.library_entries.where(rating:rating.to_i).count
				# score_great = @vn.library_entries.where(rating:8).count
				# score_good = @vn.library_entries.where(rating:6).count 
				# score_awful = @vn.library_entries.where(rating:4).count
				message = "Successfully rated #{@vn.name} with a score of #{rating}"
				warning_text = " but value will only update if there are at least #{min_ratings_required} ratings"
				vn_lib = @vn.library_entries.where.not(:rating => nil)
				#iterate and get avg total 
				vn_lib.each do |lib|
					avg_total_number += lib.rating
					avg_count += 1
				end
				if vn_lib.count > min_ratings_required
			
					@vn.rating_number = (avg_total_number / avg_count).round(2)
					# @vn.rating_number = ((score_perfect * 10.0 + score_great * 8.0 + score_good * 6.0 + score_awful*4) / (score_perfect + score_great + score_good + score_awful))
					@vn.save
					warning_text = ""
				end
				post = libentry.posts.build(detail: "#{current_user.name} has recently rated #{@vn.name} with a rating of #{rating}.",user_id: current_user.id)
				if post.save 
					redirect_to :back
					flash[:success] = message + warning_text
				end
				
			else #if already have same type of ratings, redirect and inform user
				flash[:danger] = "You have already rated #{@vn.name} with a rating of #{rating}!"
				redirect_to :back
			end
	end

end
