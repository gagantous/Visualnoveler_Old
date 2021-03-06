class DevelopersController < ApplicationController

	before_action :authenticate_user!, :only => [:edit,:new,:update]
	def show
		@developer = Developer.find(params[:id])
		@vn = @developer.vns.paginate(:page => params[:page], :per_page => 20)
	end

	def new
		@developer = Developer.new
		authorize @developer
	end

	def typeahead
	    @developer = Developer.search_by_name(params[:search])
	    render json: @developer,root: false
 	 end

	def index
		@developers = Developer.highest_vns.paginate(:page => params[:page], :per_page => 50)
	end

	def search
    	 @developers = Developer.search_by_name(params[:search]).paginate(:page => params[:page], :per_page => 25)
	end

	def edit
		@developer = Developer.find(params[:id])
		@vns = @developer.vns
		authorize @developer
	end

	def create	
    	@developer = Developer.new(char_params)  
    	if @developer.save
    		redirect_to developer_path(@developer)
    		flash[:success] = "Developer successfully created!"
    	else
    		render :action=>"new"
    	end

	end

	def update
		@developer = Developer.find(params[:id])
		authorize @developer
		if @developer.update(char_params)
			flash[:success] = "Your Developer was updated successfully!"
			redirect_to developer_path(@developer)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:developer).permit(:name,:details)
		end


end
