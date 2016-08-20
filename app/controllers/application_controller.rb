class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
     include Pundit
     helper Starburst::AnnouncementsHelper
  	 protect_from_forgery with: :exception
 	 before_action :configure_permitted_parameters, if: :devise_controller?
 	 rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	 after_filter :store_location
	 before_filter :redirect_subdomain
	 layout :layout_by_resource

	def store_location
	  # store last url - this is needed for post-login redirect to whatever the user last visited.
	  return unless request.get? 
	  if (request.path != "/users/sign_in" &&
	      request.path != "/users/sign_up" &&
	      request.path != "/users/password/new" &&
	      request.path != "/users/password/edit" &&
	      request.path != "/users/confirmation" &&
	      request.path != "/users/sign_out" &&
	      request.path != "/register" &&
	      request.path != "/logout" &&
	      request.path != root_path &&
	      request.path != "/login" &&
	      !request.xhr?) # don't store ajax calls
	    session[:previous_url] = request.fullpath 
	  end
	end  
		def after_sign_out_path_for(resource_or_scope)
		 	 session[:previous_url] || vns_path
		end
		def after_sign_in_path_for(resource)
	 		 return session[:previous_url] || vns_path
		end

	  def authenticate_user!(options={})
	    if user_signed_in?
	       super(options)
	    else
	      redirect_to login_path, :notice => 'You have to login first'
	      ## if you want render 404 page
	      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
	    end
	  end

	private

	 def redirect_subdomain
		  if request.host == 'www.visualnoveler.com'
		    redirect_to 'http://visualnoveler.com' + request.fullpath
		  end
	 end

	  def user_not_authorized
	    flash[:alert] = "You are not authorized to perform this action."
	    self.response_body = nil
	    redirect_to(session[:previous_url] || root_path)
	  end

	  	protected

		def layout_by_resource  
  		  if is_a?(Devise::SessionsController) && action_name == "new" || is_a?(Devise::RegistrationsController) && action_name == "new"
  		  	"none"
  		  else 
  		  	"application"
  		  end
		end
		def configure_permitted_parameters
		      devise_parameter_sanitizer.for(:sign_up) << :name
		      
		  	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email,:bio, :password,
		      :password_confirmation, :current_password, :poster_image,:poster_image_crop_x, :poster_image_crop_y, :poster_image_crop_w, :poster_image_crop_h) }
		end 
	 

end
