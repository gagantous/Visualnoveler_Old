class ApiController < ApplicationController
	def vn	
		# set a hard limit to prevent long ajax requests
		@vn = Vn.search_by_name(params[:search]).limit(15)
		render json: @vn,root: false
	end

	def vn_typeahead
		@vn = Vn.all
		render json: @vn,root: false,each_serializer: VnTypeaheadSerializer
	end
end
