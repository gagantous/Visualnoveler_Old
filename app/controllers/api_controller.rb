class ApiController < ApplicationController
	def vn	
		@vn = Vn.search_by_name(params[:search])
		render json: @vn,root: false
	end

	def vn_typeahead
		@vn = Vn.all
		render json: @vn,root: false,each_serializer: VnTypeaheadSerializer
	end
end
