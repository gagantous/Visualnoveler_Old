class VnsController < ApplicationController
	include VnsHelper
	before_action :authenticate_user!, :only => [:edit,:crop,:new,:update]
	def show
		@vn = Vn.find(params[:id])
		@showcharacters = @vn.characters.all
		@franchise = @vn.franchise
		@screenshots = @vn.screenshots
		@recent_reviews = @vn.reviews.all.paginate(:page => params[:page], :per_page => 4).order('created_at DESC')
		@positive_reviews = @vn.reviews.where("rating > ?",5).paginate(:page => params[:page], :per_page => 4).order('created_at DESC')
		@negative_reviews = @vn.reviews.where("rating < ?",5).paginate(:page => params[:page], :per_page => 4).order('created_at DESC')
		@vn.reviews.build
	end

	def discover
		@random = Vn.limit(5).order("RANDOM()")
	end

	def simple_create
		@vn = Vn.new
		authorize @vn
	end

	def translated
		@vn = Vn.where(:status => 1).paginate(:page => params[:page], :per_page => 35)
	end

	def walkthroughs
		@vn = Vn.where("route_url is NOT NULL and route_url != ''").paginate(:page => params[:page], :per_page => 1)
	end

	def top
		@vn = Vn.order("rating_number DESC NULLS LAST").paginate(:page => params[:page], :per_page => 35)
		#@vn = Vn.all.where(:isFeatured => true)
		#offset = rand(Vn.count)
	end

	def search
	   @vn = Vn.joins(:genres).where('genres.id' => params['genre_ids']).group('vns.id').having("count(genres.id) = ?",params['genre_ids'].count) unless params['genre_ids'].blank?
        if params['genre_ids'].blank?
          @vn = []
        end
	end

	def rate
		@vn = Vn.find(params[:id])
		type = params[:rating]
		if type != nil
			rate_vn(type)
		else
			redirect_to :back, notice: 'Nothing happened, perhaps a bug?'
		end
	end

	def edit
		@vn = Vn.find(params[:id])
		authorize @vn
		@character = @vn.characters
    	#@vn.characters.build
	end
# add to library entries favourite
	def favourite
		@vn = Vn.find(params[:id])
		type = params[:type]
		libentry = current_user.library_entries.find_or_create_by(vn_id: @vn.id)
		if type == "favourite" 
			libentry.update_attribute(:favourite,true)
			post = libentry.posts.build(detail: "#{current_user.name} has recently added #{@vn.name} to their favourites.",user_id: current_user.id)
			if post.save 
				redirect_to :back
				flash[:success] = post.detail
			end
		elsif type == "unfavourite"
			libentry.update_attribute(:favourite,false)
			post = libentry.posts.build(detail: "#{current_user.name} has recently removed #{@vn.name} from their favourites.",user_id: current_user.id)
			if post.save 
				redirect_to :back
				flash[:success] = post.detail
			end
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
			libentry.update_attribute :status, "watch"
			post = libentry.posts.build(detail: "#{current_user.name} has started playing #{@vn.name}",user_id: current_user.id)
		elsif type == "drop"
			libentry.update_attribute :status, "drop"
			post = libentry.posts.build(detail: "#{current_user.name} has dropped #{@vn.name} from their library",user_id: current_user.id)
		elsif type == "wishlist"
			libentry.update_attribute :status, "wishlist"
			post = libentry.posts.build(detail: "#{current_user.name} has added #{@vn.name} to their wishlist",user_id: current_user.id)
		elsif type =="complete"
			libentry.update_attribute :status, "complete"
			post = libentry.posts.build(detail: "#{current_user.name} has completed #{@vn.name}",user_id: current_user.id)
		end
		if post.save 
			redirect_to :back
			flash[:success] = post.detail
		else
			redirect_to :back
			flash[:danger] = "There is a bug with VN Status code"
		end
	end

	def index
		@vn = Vn.where(:isFeatured => true).paginate(:page => params[:page], :per_page => 3)
		#@vn = Vn.all.where(:isFeatured => true)
		#offset = rand(Vn.count)
		
	end

	def new
		@vn = Vn.new
		authorize @vn
    	@vn.characters.build
	end

	def update
		@vn = Vn.find(params[:id])
		authorize @vn
		if @vn.update(vn_params)
			
			flash[:success] = "Visual Novel is updated successfully!"
			redirect_to vn_path(@vn)
			#redirect_to recipe_path(@recipe)
		else
			flash[:danger] = "Failed to update the visual novel, perhaps you submitted an empty review or missed fields when creating a VN?"
			redirect_to session[:previous_url] 
		end
	end

	def crop
		@vn = Vn.find(params[:id])
		authorize @vn
		if @vn.save
			render :crop
		end
		 
	end

	def characters
		@vn = Vn.find(params[:id])
		@characters = @vn.characters
	end

	def screenshots
		@vn = Vn.find(params[:id])
		@vn.screenshots.build
		authorize @vn
	end

	def create	
    	@vn = Vn.new(vn_params) 
    	authorize @vn 
    	 if @vn.characterurl.blank? 
		 else
			 @scraper = Scraper.new(@vn,@vn.characterurl)
		 end
    	if @vn.save
    		 redirect_to vn_path(@vn)
    		 flash[:success] = "Visual novel successfully created!"
    	else
    		render :action=>"new"
    	end
 
	end

	def destroy
		@vn = Vn.find(params[:id])
		authorize @vn
	  	if @vn.destroy
	 		flash[:success] = "Visual Novel deleted! Remember to cleanup the characters with no visual novels"
	 		redirect_to admin_vn_path
	    end

	end

	private

		def vn_params
			params.require(:vn).permit(:name,:status,:route_url,:franchise_id,:characterurl,:remote_image_coverpage_url,:remote_image_1_url,:remote_image_2_url,:remote_image_3_url,:remote_image_4_url,
			:bio,:trailer_url,:image_coverpage_crop_x,:image_coverpage_crop_y, :image_coverpage_crop_w, :image_coverpage_crop_h,:rating_number,:isFeatured,
			 { characters_attributes: [:id,:_destroy,:name,:role,:summary,:voiceactor,:remote_img_string_url,:img_string,] },:release_date, :summary,:alias,
			 { :genre_ids => [] }, :developer_id,:vn_id,:image_poster,:image_coverpage,:image_1,:image_2,:image_3,:image_4,:genre_id,{ :publisher_ids => [] },
			 {screenshots_attributes: [:id,:_destroy,:name,:alt,:image,:remote_image_url] } ,:remote_image_poster_url,
			 {reviews_attributes: [:details,:rating,:status,:vn_id,:user_id,:_destroy] },:buy_1,:buy_2,:buy_3,:buy_4)
		end

end
