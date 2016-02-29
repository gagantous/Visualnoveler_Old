class BracketsController < ApplicationController

	def show
		@bracket = Bracket.find(params[:id])
		@characters = @bracket.bracket_characters
		@second_round_count = @characters.count / 2
		@third_round_count = @second_round_count / 2
		@fourth_round_count = @third_round_count / 2
		@fifth_round_count = @fourth_round_count / 2
    	render :layout => 'bracket'
	end
	
	def setup
		@bracket = Bracket.find(params[:id])
		@characters = @bracket.bracket_characters
	end

	def new
		@bracket = Bracket.new
	end
	def index
		@brackets = Bracket.all
	end

# create the bracket
	def make
		@bracket = Bracket.find(params[:id])	
		# if @bracket.bracket_characters.count.even?
		# 	flash[:success] = "Number of characters in Bracket is even!"
		# 	redirect_to :back
		# end
	end

	def crop
		@bracket = Bracket.find(params[:id])
		@character = BracketCharacter.find(params[:char_id])
	end
	def nominate
		@bracket = Bracket.find(params[:id])
		@character = @bracket.bracket_characters.build
	end

	def edit
		@bracket = Bracket.find(params[:id])
	end

	def create	
    	@bracket = Bracket.new(char_params)  
    	if @bracket.save
    		redirect_to bracket_path(@bracket)
    		flash[:success] = "Bracket created successfully!"
    	else
    		render :action=>"new"
    	end

	end

	def destroy
		@bracket = Bracket.find(params[:id])
	  	if @bracket.destroy
	 		flash[:success] = "Bracket deleted!"
	 		redirect_to brackets_path
	    end

	end

	def nominate_update
		@bracket = Bracket.find(params[:id])
		if @bracket.update(char_params)
			flash[:success] = "Your Bracket was updated successfully! from nominate_update"
			redirect_to bracket_path(@bracket)
		else
			render :edit
		end
	end

	def update
		@bracket = Bracket.find(params[:id])
		if @bracket.update(char_params)
			flash[:success] = "Your Bracket was updated successfully!"
			redirect_to bracket_path(@bracket)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:bracket).permit(:name,{ bracket_characters_attributes: [:id,:_destroy,:name,:details,:image,:image_crop_x,:image_crop_y, :image_crop_w, :image_crop_h,:remote_image_url,] },:details,{ :bracket_characters_ids => [] })
		end

end
