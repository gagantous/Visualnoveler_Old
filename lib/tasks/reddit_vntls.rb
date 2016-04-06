require 'rake'
  desc "Grab VNTLS Data"
  task :reddit_vntls => :environment do
	def scrape_reddit(url)
		date = get_reddit_thread_markdown_post(url + ".json")
		sleep(3)
		mechanize = Mechanize.new
		page = mechanize.get(url)
		title = page.search("a.title")
		post_content = page.search(".usertext-body")[1]
		#lists are <li> entries whiich are visual novel updates
		lists = post_content.search('ul > li')
		lists.each do |list|
			if list.text.strip.include?("-")
				text = list.text.strip
				update = text.sub(/.*?-/,'').strip
				title = text.split(/-/).first.strip
				parse_translation_update(title,update,Time.at(date))
				#p title + " - " + update
			else 
			end
		end
	end

	def get_reddit_thread_markdown_post(url)
		json_url = URI(url)
		response = Net::HTTP.get(json_url)
		json_data = JSON.parse (response)
		structure = json_data[0]["data"]["children"][0]["data"]["selftext"]
		date = json_data[0]["data"]["children"][0]["data"]["created"]
		title = json_data[0]["data"]["children"][0]["data"]["title"]
		post = structure.slice(structure.index("Note: This is simply")..-1)
		translation_news = News.new(title: title,user_id: 12,content: post,created_at: Time.at(date))
		translation_news.tag_list.add("translation status")
		if translation_news.save
			p "News updated!"
		end
		return date
	end

	def parse_translation_update(title,update,date)
		vns = Vn.search_by_name(title)
		title_array = []
		#If there is only 1 result, we assume that we are posting to the correct record
		if vns.count == 1
			translation = TranslationPost.new(post: update,created_at: date,vn_id: vns.id)
			if translation.save
				p "Parsed translation update successfully"
			end
		elsif vns.count > 1 
			#multiple records found matching, we need a human to verify!
			vns.each do |vn|
				title_array << vn.name
			end
			translation = TranslationPost.new(post: update,created_at: date,pending: true,pending_vn_names: vns.join(","))
			if translation.save
				p "Translation update pending approval, Multiple Vns detected"
			end
		else 
			# no records, manual action required
			translation = TranslationPost.new(post: update,created_at: date,pending: true,pending_vn_names: title)
			if translation.save
				p "Translation update pending approval, No Vns found"
			end
		end
	end


	def parse_reddit_list(url)
		mechanize = Mechanize.new
		mechanize.user_agent = 'Mac Safari'
	end

	scrape_reddit("https://www.reddit.com/r/visualnovels/comments/2n5aeo/translation_status_updatediscussion_thread_nov_23/")
end