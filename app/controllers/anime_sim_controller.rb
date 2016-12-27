class AnimeSimController < ApplicationController
	
	def home
    	render :layout => 'anime_sim'
  	end

	def about
		render :layout => 'anime_sim'
	end

	def characters
		render :layout => 'anime_sim'
	end

	def gallery
		render :layout => 'anime_sim'
	end

	def story
		render :layout => 'anime_sim'
	end

	def press
		render :layout => 'none'
	end
end
