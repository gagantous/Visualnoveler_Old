class DevelopersController < ApplicationController
	def show
		@developer = Developer.find(params[:id])
		@vns = @developer.vns
	end

	def new
		@developer = Developer.new
	end

	def index
		@developers = Developer.limit(12).order("RANDOM()")
	end

	def edit
		@developer = Developer.find(params[:id])
	end

	def create	
    	@developer = Developer.new(char_params)  
    	if @developer.save
    		redirect_to developer_path(@developer)
    	else
    		render :action=>"new"
    	end

	end

	def update
		@developer = Developer.find(params[:id])
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
