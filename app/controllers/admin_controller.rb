class AdminController < ApplicationController
	def vn
		@vn = Vn.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 15)
		if !current_user.admin? 
			user_not_authorized
		end
	end

	def genre
		@genre = Genre.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 15)
		if !current_user.admin? 
			user_not_authorized
		end
	end

	def character
		@character = Character.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 15)
		if !current_user.admin? 
			user_not_authorized
		end
	end

	def screenshot
		@screenshot = Screenshot.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 15)
		if !current_user.admin? 
			user_not_authorized
		end
	end

	def users
		@user = User.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 15)
		if !current_user.admin? 
			user_not_authorized
		end
	end

	def developer
		@developer = Developer.all.order("updated_at DESC").paginate(:page => params[:page],:per_page => 15)
		if !current_user.admin? 
			user_not_authorized
		end
	end
end
