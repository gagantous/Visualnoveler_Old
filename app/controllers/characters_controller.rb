class CharactersController < ApplicationController

	def show
		@character = Character.find(params[:id])
	end

	def new
		@character = Character.new
	end

	def edit
		@character = Character.find(params[:id])
	end

	def create	
    	@character = Character.new(char_params)  
    	if @character.save

    	else
    		render :action=>"new"
    	end

	end

	def update
		@character = Character.find(params[:id])
		if @character.update(char_params)
			flash[:success] = "Your character was updated successfully!"
			redirect_to characters_path(@character)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:character).permit(:name, :summary,:voiceactor,:vn_name,:vn_id,:img_string)
		end

end
