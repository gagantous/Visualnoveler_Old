class RatSimulatorController < ApplicationController
	def home
		render :layout => 'rat_simulator'
	end

	def press
		render :layout => 'presskit'
	end
end
