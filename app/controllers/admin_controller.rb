class AdminController < ApplicationController
	def vn
		@vn = Vn.order("updated_at DESC").paginate(:page => params[:page],:per_page => 600)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def publisher
		@publishers = Publisher.all
	end

	def translation
		@translations = TranslationPost.where(pending: true).paginate(:page => params[:page], :per_page => 100)
	end

	def vn_featured
		@vn = Vn.where(isFeatured: true).order("updated_at DESC")
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
	def vn_other_nil
		@vn = Vn.all#.created_between(6.day.ago, Time.now)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def vn_not_featured
		@vn = Vn.where(isFeatured: false).order("updated_at DESC")
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def review
		@review = Review.order("updated_at DESC").paginate(:page => params[:page],:per_page => 30)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def genre
		@genre = Genre.order("updated_at DESC")
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def franchise
		@franchise = Franchise.order("updated_at DESC")
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def delete_lonely_character
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
		Character.find_each do |c|
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
		@character = Character.order("updated_at DESC")
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def character
		@character = Character.order("updated_at DESC").paginate(:page => params[:page],:per_page => 100)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def screenshot
		@screenshot = Screenshot.order("updated_at DESC").paginate(:page => params[:page],:per_page => 30)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def users
		@user = User.order("updated_at DESC").paginate(:page => params[:page],:per_page => 40)
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end

	def developer
		@developer = Developer.order("updated_at DESC")
		if !current_user.admin? && !current_user.mod? 
			user_not_authorized
		end
	end
end
