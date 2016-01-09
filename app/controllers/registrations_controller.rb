class RegistrationsController < Devise::RegistrationsController

  protected
    def update_resource(resource, params)
	  resource.update_without_password(params)
	end

    def after_update_path_for(resource)
      user_path(resource)
    end

    def after_inactive_sign_up_path_for(resource)
    	new_user_session_path
    	#flash[:success] = "Welcome! You have signed up successfully. You will receive an email with instructions about how to confirm your account in a few minutes."
  	end

 
end