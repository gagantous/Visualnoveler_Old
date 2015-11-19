class RegistrationsController < Devise::RegistrationsController

 before_action :configure_permitted_parameters

  def update_sanitized_params
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
    end
  protected

    def after_update_path_for(resource)
      user_path(resource)
    end
    
end