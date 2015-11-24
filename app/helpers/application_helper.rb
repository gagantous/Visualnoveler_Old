module ApplicationHelper
	def resource_name
   	 :user
 	end
 	def title(text)
 	   content_for :title, text
 	end
 	def description(text)
 	   content_for :description, text
 	end
  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  
end
