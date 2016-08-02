require 'rake'
  desc "Delete duplicate translation posts for VNs"
  task :duplicate_vntls => :environment do

  	#update the bool pending to not be nil
  	# TranslationPost.find_each do |post|
  	# 	if post.pending.nil?
  	# 		post.pending = false
  	# 		post.save
  	# 	end
  	# end
  	# p "Successfully set all translation posts pending from nil to false"
  	 Vn.find_each do |vn|
  	 	@translation_posts = []
		vn.translation_posts.order("created_at ASC").each do |update|
			if @translation_posts.include? update.post
				#Duplicate found 
				update.destroy
				p "Found duplicate #{update.post}"
			else 
				@translation_posts << update.post
			end
		end
	 end

  	p "Successfully removed all duplicate translation posts"
	end