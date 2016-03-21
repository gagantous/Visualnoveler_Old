module UsersHelper
	def status_text(text)
		if text == "watch"
			return "Playing"
		elsif text == "complete"
			return "Completed"
		elsif text == "drop"
			return "Dropped"
		elsif text == "wishlist"
			return "Wishlist"
		elsif text =="backlog"
			return "Backlog"
		else
			return "Favourite"
		end

	end

	def compute_average(library)
		avg_score = 0.0
		library.each do |lib|
	      avg_score += lib.rating
	    end
   		avg_score = (avg_score / library.count.to_f)
   		return avg_score.round(1)
	end

	def library_css
		return "<style>
body{
	background: url(<%= asset_path('lib2.png') %>) no-repeat center center fixed !important; 
  -webkit-background-size: cover !important;
  -moz-background-size: cover !important;
  -o-background-size: cover !important;
  background-size: cover !important;
}
</style>".html_safe
	end
end
