module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name 
	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email,:bio, :password,
		      :password_confirmation, :current_password, :poster_image,:poster_image_crop_x, :poster_image_crop_y, :poster_image_crop_w, :poster_image_crop_h,:library_image,:library_image_type,:remove_library_image) }
  end

end

DeviseController.send :include, DevisePermittedParameters