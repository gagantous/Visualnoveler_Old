class PasswordsController < Devise::PasswordsController
  def new
  	super
  end
  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    return login_path
  end
end