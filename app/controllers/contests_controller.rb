class ContestsController < ApplicationController

	def show
		@contest = Contest.find(params[:id])
	end

	def new
		@contest = Contest.new
	end
	def index
		@contests = Contest.all
	end

	def edit
		@contest = Contest.find(params[:id])
	end

	def create	
    	@contest = Contest.new(char_params)  
    	if @contest.save
    		redirect_to contest_path(@contest)
    		flash[:success] = "Contest created successfully!"
    	else
    		render :action=>"new"
    	end

	end

	def destroy
		@contest = Contest.find(params[:id])
	  	if @contest.destroy
	 		flash[:success] = "Contest deleted!"
	 		redirect_to contests_path
	    end

	end

	def update
		@contest = Contest.find(params[:id])
		authorize @contest
		if @contest.update(char_params)
			flash[:success] = "Your Contest was updated successfully!"
			redirect_to contest_path(@contest)
		else
			render :edit
		end
	end

	private
		def char_params
			params.require(:contest).permit(:name, :details,{ :Contest_ids => [] })
		end

end
