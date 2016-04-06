require 'rake'
  desc "Grab Reddit VNTLS data"
  task :reddit_vntls => :environment do
	def scrape_reddit(url)
		date = get_reddit_thread_markdown_post(url + ".json")
		sleep(2)
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
		#p "#{url} successfully scraped"
	end

	def get_reddit_thread_markdown_post(url)
		json_url = URI(url)
		retries_count = 5
		begin
			sleep(2)
			response = Net::HTTP.get(json_url)
			json_data = JSON.parse (response)
			structure = json_data[0]["data"]["children"][0]["data"]["selftext"]
			date = json_data[0]["data"]["children"][0]["data"]["created"]
			title = json_data[0]["data"]["children"][0]["data"]["title"]
			post = structure.slice(structure.index("Note: This is simply")..-1)
			translation_news = News.new(title: title,user_id: 12,content: post,created_at: Time.at(date))
			translation_news.tag_list.add("translation status")
			if translation_news.save
			#	p "News updated!"
			end
		#	p "Success"
		rescue Exception => e
			retries_count -= 1
			if retries_count > 0
				retry
			else
				p "WARNING, failed to scrape #{url}"
			end
		end
		return date
	end

	def parse_translation_update(title,update,date)
		vns = Vn.search_by_name(title)
		title_array = []
		#If there is only 1 result, we assume that we are posting to the correct record
		if vns.count == 1
			@vn = vns.first
			translation = TranslationPost.new(post: update,created_at: date,vn_id: @vn.id)
			if translation.save
				#p "Translation Update successful!"
			end
		elsif vns.count > 1 
			#multiple records found matching, we need a human to verify!
			vns.each do |vn|
				title_array << vn.name
			end
			translation = TranslationPost.new(post: update,created_at: date,pending: true,pending_vn_names: title_array.join(","))
			if translation.save
			#	p "Translation update pending approval, Multiple Vns detected"
			end
		else 
			# no records, manual action required
			translation = TranslationPost.new(post: update,created_at: date,pending: true,pending_vn_names: title)
			if translation.save
				#p "Translation update pending approval, No Vns found"
			end
		end
	end


	def parse_reddit_list(url)
      #loop function pagination GET
      mechanize = Mechanize.new
      page = mechanize.get(url)
      scrape_reddit(url)
      loop do
        find_links = page.link_with(text: "Next Thread")
        if find_links 
          page = find_links.click
          url = page.uri.to_s
          p "Next url is #{url}"
          scrape_reddit(url)
        else 
          p "Can't find anymore links"
          break
       	end
      end
	end
	parse_reddit_list("https://www.reddit.com/r/visualnovels/comments/2n5aeo/translation_status_updatediscussion_thread_nov_23/")
	p "Data imported Successfully!"
	#get_reddit_thread_markdown_post("https://www.reddit.com/r/visualnovels/comments/2oj1y9/translation_status_updatediscussion_dec_7/.json")
	#scrape_reddit("https://www.reddit.com/r/visualnovels/comments/2mg43j/translation_status_updatediscussion_thread/")
	end