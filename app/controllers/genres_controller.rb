class GenresController < ApplicationController
	def show
		@genre = Genre.find(params[:id])
		@vns = @genre.vns
	end

	def new
		@genre = Genre.new
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def create	
    	@genre = Genre.new(char_params)  
    	if @genre.save

    	else
    		render :action=>"new"
    	end

	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(char_params)
			flash[:success] = "Your Genre was updated successfully!"
			redirect_to genres_path(@genre)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:genre).permit(:name)
		end
end
