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
