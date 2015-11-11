class StaticPagesController < ApplicationController
  def home
    render :layout => 'home'
  end

  def subscribe
  		gb = Gibbon::Request.new(api_key: "fed2ee444de2a19b223023584a313766-us12")
  		begin
  			subscribe = gb.lists("ab585714dd").members.create(body: {email_address: params[:email][:address], status: "subscribed"})
  		rescue Gibbon::MailChimpError => e

  			render 'home'
  		end
    	#gb.lists.subscribe({:id => "8b909befae", :email => {:email => "wraithseekers@gmail.com"}, :double_optin => false})
  end

  def help
  end
end
