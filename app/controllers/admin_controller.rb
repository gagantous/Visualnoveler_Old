class AdminController < ApplicationController
	def vn
		@vn = Vn.all.order("updated_at DESC")
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def vn_featured
		@vn = Vn.where(isFeatured: true).order("updated_at DESC").all
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def vn_no_screenshot
		@vn = Vn.created_between(6.day.ago, Time.now)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def vn_not_featured
		@vn = Vn.where(isFeatured: false).order("updated_at DESC").all
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def review
		@review = Review.all.order("updated_at DESC").all
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def genre
		@genre = Genre.all.order("updated_at DESC").all
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def franchise
		@franchise = Franchise.all.order("updated_at DESC").all
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def delete_lonely_character
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
		Character.all.each do |c|
			if c.vns.blank?
				if !c.destroy
					redirect_to :back
					flash[:danger] = "There was a bug deleting lonely characters"
				end
			end

		end
		redirect_to :back
		flash[:success] = "All lonely characters are successfully deleted!"
	end
	def lonely_character	
		@character = Character.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 50)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def character
		@character = Character.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 50)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def screenshot
		@screenshot = Screenshot.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 15)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def users
		@user = User.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 15)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def developer
		@developer = Developer.all.order("updated_at DESC").all
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end
end
