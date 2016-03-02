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
    options = {
      link_attributes: { rel: 'nofollow', target: "_blank" },
      autolink: true
    }
 	  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(options),
	    extensions = {autolink:true})
    
	 return markdown.render(text).html_safe
	end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def display_avatar(user,css_class)  
    if user_signed_in?
      if user.poster_image?
        image_tag(user.poster_image.url,:class => css_class) 
      else
        image_tag("default_avatar.jpg",:class => css_class)
       end  
    else
      return
    end  
  end

  def display_avatar_no_sign_in(user,css_class)  
 
      if user.poster_image?
        image_tag(user.poster_image.url,:class => css_class) 
      else
        image_tag("default_avatar.jpg",:class => css_class)
       end  

    end  


  
end
