class CharactersController < ApplicationController
	before_action :authenticate_user!, :only => [:edit,:new,:update]
	def show
		@character = Character.find(params[:id])
	end

	def search
    	 @character = Character.search_by_name(params[:search])
	end

	def new
		@character = Character.new
		authorize @character
	end

	def edit
		@character = Character.find(params[:id])
		authorize @character
	end

	def create	
    	@character = Character.new(char_params)  
    	if @character.save
    		redirect_to vn_path(@character.vns.first)
    		flash[:success] = "Character created successfully!"
    	else
    		render :action=>"new"
    	end

	end

	def destroy
		@character = Character.find(params[:id])
		authorize @character
	  	if @character.destroy
	 		flash[:success] = "Character deleted!"
	 		redirect_to admin_character_path
	    end

	end

	def update
		@character = Character.find(params[:id])
		authorize @character
		if @character.update(char_params)
			flash[:success] = "Your character was updated successfully!"
			redirect_to admin_character_path
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:character).permit(:name, :summary,:voiceactor,:vn_name,:vn_id,:img_string,{ :vn_ids => [] })
		end

end
