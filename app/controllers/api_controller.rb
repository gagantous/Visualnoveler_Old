class ApiController < ApplicationController
	def vn	
		@vn = Vn.search_by_name(params[:search])
		render json: @vn,root: false
	end
end
