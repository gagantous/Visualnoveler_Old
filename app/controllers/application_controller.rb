class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  
	protected
		def configure_permitted_parameters
		      devise_parameter_sanitizer.for(:sign_up) << :name
		      
		  	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password,
		      :password_confirmation, :current_password, :poster_image,:poster_image_crop_x, :poster_image_crop_y, :poster_image_crop_w, :poster_image_crop_h) }
		end 

		 def after_sign_out_path_for(resource_or_scope)
		 	 request.referrer
		end
		def after_sign_in_path_for(resource)
			 request.referrer
		end
	 

end
