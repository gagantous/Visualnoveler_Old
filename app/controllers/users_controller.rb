class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:crop] #:edit , :update

  def show
  	@user = User.find(params[:id])
    authorize @user
  	@posts = @user.posts.paginate(:page => params[:page], :per_page => 6).order('created_at DESC')
    @lib = @user.library_entries.where(favourite: true).limit(8)
    if current_user == @user 
      @new_post =  @user.posts.build
    end
    @comments = Comment.where(wall_author_id: @user.id).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    @new_comment = @user.comments.build
    # @new_comment.update_attribute(:wall_user_id,@user.id)
  end


  def watch
	  @user = User.find(params[:id])
    authorize @user
  	@lib = @user.library_entries.where(status: "watch")
  end

  def wishlist
  	@user = User.find(params[:id])
    authorize @user
  	@lib = @user.library_entries.where(status: "wishlist")
  end

  def favourite
    @user = User.find(params[:id])
    authorize @user
    @lib = @user.library_entries.where(favourite: true)
  end

  def drop
	   @user = User.find(params[:id])
    authorize @user
     @lib = @user.library_entries.where(status: "drop")
  end

  def completed
     @user = User.find(params[:id])
     authorize @user
     @lib = @user.library_entries.where(status: "complete")
  end

  def edit
     @user = User.find(params[:id])
     authorize @user
  end

  def update_avatar
    @user = current_user
    @user.update_attributes(user_params)
    flash[:success] = "it worked"
    redirect_to user_path(@user)
  end

  def update
      @user = User.find(params[:id])
      authorize @user
      if @user.update(user_params)
        flash[:success] = "You have successfully updated your profile!"
        redirect_to user_path(@user)
      else
        render :edit
      end
  end
  def crop
    @user = User.find(params[:id])
    authorize @user
  end
  def index

  end

    private
    def user_params
       params.require(:user).permit(:poster_image_crop_x, :poster_image_crop_y, :poster_image_crop_w, :poster_image_crop_h)
    end

end
