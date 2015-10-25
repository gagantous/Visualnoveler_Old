class VnsController < ApplicationController

	def show
		@vn = Vn.find(params[:id])
		@showcharacters = @vn.characters.all
	end

	def edit
		@vn = Vn.find(params[:id])
	end

	def index
		@vn = Vn.all
	end

	def new
		@vn = Vn.new
	end

	def update

		@vn = Vn.find(params[:id])
		if @vn.update(vn_params)
			flash[:success] = "Visual Novel is updated successfully!"
			redirect_to vn_path(@vn)
			#redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end

	def create	
    	@vn = Vn.new(vn_params)  
    	if @vn.save

    	else
    		render :action=>"new"
    	end

	end

	private
		def vn_params
			params.require(:vn).permit(:name,:release_date, :summary,:genre,:developer,:rating,:vn_id,:image_poster,:image_coverpage,:image_1,:image_2,:image_3,:image_4)
		end

end
