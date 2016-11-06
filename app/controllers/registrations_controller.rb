class RegistrationsController < Devise::RegistrationsController
   before_filter :configure_permitted_parameters

  protected
    def update_resource(resource, params)
	  resource.update_without_password(params)
	end

    def after_update_path_for(resource)
      if params[:user][:header_image].present?
        crop_user_path(resource) 
      else 
        user_path(resource) 
      end
    end

    def after_inactive_sign_up_path_for(resource)
    	new_user_session_path
    	#flash[:success] = "Welcome! You have signed up successfully. You will receive an email with instructions about how to confirm your account in a few minutes."
  	end

    def after_sign_up_path_for(resource)
      root_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:name) 
      devise_parameter_sanitizer.for(:account_update).push(:name, :email,:bio, :password,
          :password_confirmation,:current_password,:header_image,:header_image_crop_x,:header_imagecrop_y, :header_image_crop_w,:header_image_crop_h,
          :poster_image,:library_image,:library_image_type,:remove_library_image)
    end

 
end