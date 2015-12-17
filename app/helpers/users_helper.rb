module UsersHelper
	def status_text(text)
		if text == "watch"
			return "Watching"
		elsif text == "complete"
			return "Completed"
		elsif text == "drop"
			return "Dropped"
		elsif text == "wishlist"
			return "Wishlist"
		else
			return "None"
		end

	end
end
