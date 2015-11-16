class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.paginate(:page => params[:page], :per_page => 6).order('created_at DESC')
    @lib = @user.library_entries.where(favourite: true)
  end

  def watch
	  @user = User.find(params[:id])
  	@lib = @user.library_entries.where(status: "watch")
  end

  def wishlist
  	@user = User.find(params[:id])
  	@lib = @user.library_entries.where(status: "wishlist")
  end

  def drop
	   @user = User.find(params[:id])
     @lib = @user.library_entries.where(status: "drop")
  end

  def completed
     @user = User.find(params[:id])
     @lib = @user.library_entries.where(status: "completed")
  end

  def edit

     @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "You have successfully updated your profile!"
        redirect_to user_path(@user)
      else
        render :edit
      end
  end
  def crop

    @user = User.find(params[:id])
  end
  def index

  end

    private
    def user_params
       params.require(:user).permit(:poster_image_crop_x, :poster_image_crop_y, :poster_image_crop_w, :poster_image_crop_h)
    end

end
