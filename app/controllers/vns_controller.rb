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
# add to library entries favourite
	def favourite
		@vn = Vn.find(params[:id])
		type = params[:type]
		libentry = current_user.library_entries.find_or_create_by(vn_id: @vn.id)
		if type == "favourite" 
			libentry.update_attribute(:favourite,true)
			redirect_to :back
			flash[:success] = "You favourited #{@vn.name}"
		elsif type == "unfavourite"
			libentry.update_attribute(:favourite,false)
			redirect_to :back
			flash[:success] = "You removed #{@vn.name} from your library"
		else
			redirect_to :back, notice: 'Nothing happened, perhaps a bug?'
		end
	end
# add to library entries Status (Watching/Dropped/Wishlist)
	def status
		@vn = Vn.find(params[:id])
		type = params[:type]
		libentry = current_user.library_entries.find_or_create_by(vn_id: @vn.id)
		 if type == "watch" 
		# 	status: "watch",vn_id: @vn.id,user_id: current_user.id, name: @vn.name
			libentry.update_attribute :status, "watch"
			redirect_to :back
			flash[:success] = "You started watching #{@vn.name}"
		elsif type == "drop"
			# current_user.favourites.delete(@vn)
			libentry.update_attribute :status, "drop"
			redirect_to :back
			flash[:success] = "You dropped #{@vn.name}from your library"
		elsif type == "wishlist"
			libentry.update_attribute :status, "wishlist"
			redirect_to :back
			flash[:success] = "You put #{@vn.name} in your wishlist"
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
			params.require(:vn).permit(:name,:isFeatured,{ characters_attributes: [:id,:_destroy,:name,:summary,:voiceactor,:img_string] },:release_date, :summary,:genre_old,{ :genre_ids => [] },:developer,:rating,:vn_id,:image_poster,:image_coverpage,:image_1,:image_2,:image_3,:image_4,:genre_id)
		end

end
