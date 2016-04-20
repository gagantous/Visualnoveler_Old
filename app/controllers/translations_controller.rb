class TranslationsController < ApplicationController
	def index
		#@posts = TranslationPost.includes(:vns)
		@posts = TranslationPost.where.not(pending: true).order("created_at ASC").paginate(:page => params[:page], :per_page => 50)
	end
end
