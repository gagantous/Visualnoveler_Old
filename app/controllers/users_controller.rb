class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, :only => [:crop] #:edit , :update

  def show
  	@user = User.find(params[:id])
    authorize @user
  	@posts = @user.posts.order('created_at DESC').limit(8)
    @favourites = @user.library_entries.where(favourite: true).limit(10)
    @ratings = @user.library_entries.where.not(:rating => nil).order('updated_at DESC').limit(5)
    if user_signed_in?
      if current_user == @user 
        @new_post =  @user.posts.build
      else
        @user_lib = @user.library_entries
        @current_user_lib = current_user.library_entries
        @similarities = @user_lib.map{|lib| lib[:vn_id] } & @current_user_lib.map {|lib| lib[:vn_id]}
        @similar_lib = @current_user_lib.select { |f| @similarities .include? f[:vn_id] }
        #some bad looping?
      end
    end

    @comments = Comment.where(wall_author_id: @user.id).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    @new_comment = @user.comments.build
    # @new_comment.update_attribute(:wall_user_id,@user.id)
  end

  def index
    # kinda bad for the long term, should be changed.
    #2 is the number to check if they have a min of two library_entries
    #@random = User.where.not(:poster_image => nil)
    @random = User.where.not(:poster_image => nil).joins(:library_entries).group("users.id").having("count(library_entries.id) > ?",2).order("RANDOM()").limit(12)
  end

  def library
    @user = User.find(params[:id])
    @lib = @user.library_entries.priority_order.joins(:vn).order('vns.name')
    @lib_fav = @user.library_entries.where(favourite: true).joins(:vn).order('vns.name')
    @lib_completed = @lib.where(status: "complete").joins(:vn).order('vns.name')
    @lib_wishlist = @lib.where(status: "wishlist").joins(:vn).order('vns.name')
    @lib_dropped = @lib.where(status: "drop").joins(:vn).order('vns.name')
    @lib_watched = @lib.where(status: "watch").joins(:vn).order('vns.name')
    @lib_backlog = @lib.where(status: "backlog").joins(:vn).order('vns.name')
    @avg_lib_score = @lib.where.not(rating: nil)
    @avg_lib_playingScore = @lib_watched.where.not(rating: nil)
    @avg_lib_completedScore = @lib_completed.where.not(rating: nil)
    @avg_lib_favScore = @lib_fav.where.not(rating: nil)
    
    render :layout => 'none'
  end

  def update_lib_notes

    @user = User.find(params[:id])
    @lib = @user.library_entries
  end

  def update_header
    @user = current_user
    @user.update_attributes(user_params)
    flash[:success] = "Successfully cropped your header background image."
    redirect_to user_path(@user)
  end

  def similar
    @user = User.find(params[:id])
    @user_lib = @user.library_entries
    @current_user_lib = current_user.library_entries
    @similarities = @user_lib.map{|lib| lib[:vn_id] } & @current_user_lib.map {|lib| lib[:vn_id]}
    @similar_lib = @current_user_lib.order('vn_id ASC').select{ |f| @similarities .include? f[:vn_id] }
    @similar_user_lib_rating = @user_lib.order('vn_id ASC').select { |f| @similarities .include? f[:vn_id] }
  end

  def edit
     @user = User.find(params[:id])
     authorize @user
  end

  def change_password
    @user = User.find(params[:id])
  end

  def setup
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      authorize @user
      if @user.update(user_params)
        flash[:success] = "You have successfully updated your profile!"
        redirect_to user_path(@user)
      else
        flash[:danger] = "There was an error updating your profile"
        redirect_to :back
      end
  end

  def crop
    @user = User.find(params[:id])
    authorize @user
  end

  def typeahead
      @user = User.search_by_name(params[:search])
      render json: @user,root: false
  end

  def search
    @users = User.search_by_name(params[:search])
  end

  def reviews
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(:page => params[:page], :per_page => 10)
  end

  def twitter_register
    @form = TwitterForm.new(params[:twitter_form])
    if @form.valid?
      email = params[:twitter_form][:email]      
      @user = User.from_twitter_omniauth(session["devise.twitter_data"],email)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
        sign_in_and_redirect @user, :event => :authentication
      else
        redirect_to register_path 
      end
    else 
      render 'callbacks/twitter',layout: 'none'
    end
  end

  private
    def user_params
        #
       params.require(:user).permit(:name,:bio,:role,:current_password,:password,
                      :header_image,:header_image_crop_x, :header_image_crop_y, :header_image_crop_w, :header_image_crop_h,
                      :password_confirmation,:library_image,:library_image_type)
    end

end
