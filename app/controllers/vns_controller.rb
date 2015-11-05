class VnsController < ApplicationController

	def show
		@vn = Vn.find(params[:id])
		@showcharacters = @vn.characters.all
	end

	def edit
		@vn = Vn.find(params[:id])
		@character = @vn.characters.all
    	@vn.characters.build
	end
# add to library entries
	def favourite
		@vn = Vn.find(params[:id])
		type = params[:type]
		if type == "favourite" 
			current_user.favourites << @vn
			redirect_to :back
			flash[:success] = "You favourited #{@vn.name}"
		elsif type == "unfavourite"
			current_user.favourites.delete(@vn)
			redirect_to :back
			flash[:success] = "You removed #{@vn.name} from your library"
		else
			redirect_to :back, notice: 'Nothing happened, perhaps a bug?'
		end

	end

	def index
		@vn = Vn.all
		#@vn = Vn.all.where(:isFeatured => true)
		#offset = rand(Vn.count)
		@random = Vn.limit(5).order("RANDOM()")
	end

	def new
		@vn = Vn.new
    	@vn.characters.build
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
			params.require(:vn).permit(:name,:isFeatured,{ characters_attributes: [:id,:_destroy,:name,:summary,:voiceactor,:img_string] },:release_date, :summary,:genre,:developer,:rating,:vn_id,:image_poster,:image_coverpage,:image_1,:image_2,:image_3,:image_4)
		end

end
