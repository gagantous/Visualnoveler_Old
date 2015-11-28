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
 	def markdown(text)
 	 markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
	    extensions = {})

	return markdown.render(text).html_safe
	end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def display_avatar(user,css_class)  
    unless user.poster_image
      image_tag(user.poster_image.url) 
    else
      image_tag("default_avatar.jpg",:class => css_class)
     end    
  end

  
end
