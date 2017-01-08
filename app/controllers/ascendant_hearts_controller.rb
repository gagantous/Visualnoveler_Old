class AscendantHeartsController < ApplicationController

	def home
		render :layout => 'ascendant_hearts'
	end

	def press
		render :layout => 'presskit'
	end
end
