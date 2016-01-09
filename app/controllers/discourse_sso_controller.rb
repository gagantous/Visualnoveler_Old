class DiscourseSsoController < ApplicationController
	before_action :authenticate_user! # ensures user must login

  def sso
    secret = "wraith_test"
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email # from devise
    sso.name = current_user.full_name # this is a custom method on the User class
    sso.username = current_user.email # from devise
    sso.external_id = current_user.id # from devise
    sso.sso_secret = secret

    redirect_to sso.to_url("http://forums.visualnoveler/session/sso_login")
  end
end
