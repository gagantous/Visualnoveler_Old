class DestinyChroniclesController < ApplicationController
	def home
		render :layout => 'destiny_chronicles'
	end

	def success
		render :layout => 'destiny_chronicles'
	end

	def press
		render :layout => 'presskit'
	end
end
