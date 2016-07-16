class DiscoverController < ApplicationController
	 def users
	    # kinda bad for the long term, should be changed.
	    #2 is the number to check if they have a min of two library_entries
	    @random = User.where.not(:poster_image => nil).joins(:library_entries).group("users.id").having("count(library_entries.id) > ?",2).order("RANDOM(),updated_at DESC").limit(14)
  	end
end
