require 'single_sign_on'
class DiscourseSsoController < ApplicationController
	before_action :authenticate_user! # ensures user must login

  def sso
    secret = ENV["DISCOURSE_SECRET_KEY"]
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = current_user.email # from devise
    #sso.name = current_user.name # for now we want users to be able to pick a custom name 
    sso.username = current_user.name # from devise
    sso.external_id = current_user.id # from devise
    sso.sso_secret = secret
    sso.avatar_url = current_user.poster_image.url
    redirect_to sso.to_url("http://forums.visualnoveler.com/session/sso_login")
  end
end
