require 'rake'
  desc "Grab Reddit VNTLS data"
  task :reddit_vntls => :environment do
  	@failed_url = []
  	@development_user_id = 12
  	@production_user_id = 43
  	@redundant_vns = ["Monster girl quest paradox","My Boss Wife is My Ex","Kuroinu",
  					"Imouto Paradise 2","Kyonyuu Fantasy","Fata morgana fan disc",
  					"Sumeragi Ryoko","Sweet Home","Oreimo Tsuzuku","Hoka no Onna","2236 A.D.",
  					"Lovely Cation","WEE 3","Grisaia trilogy","Muv Luv Trilogy","Trinoline",
  					"Onmyou Kishi Towako"]

	def scrape_reddit(url)
		#sleep(2)
		retries_count = 0
		begin
			mechanize = Mechanize.new
	  		mechanize.user_agent_alias = 'Mac Safari'
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
					parse_translation_update(title,update,Date.today)
					#p title + " - " + update
				end
			end
		rescue Exception => e
			p e.message
			retries_count += 1
			sleep(2.5)
			retry if retries_count <= 3
		end
		#p "#{url} successfully scraped"
	end

	def is_duplicate_translations?(update) 
		#grab translation posts within this month to check if they are duplicates
		translation_posts = TranslationPost.this_month
		is_duplicate = false
		translation_posts.each do |translation|
			if translation.post == update
				is_duplicate = true
				break
			end
		end
		return is_duplicate
	end

	def parse_translation_update(title,update,date)
		vns = Vn.search_by_name(title)
		title_array = []
		if @redundant_vns.include?(title)
			# stop parsing if title is in filtered list
			return
		end
		if is_duplicate_translations?(update)
			p "duplicate detected"
			return
		end
	
		#If there is only 1 result, we assume that we are posting to the correct record
		if vns.count == 1
			@vn = vns.first
			@translation = TranslationPost.where(post: update,vn_id: @vn.id)
			if @translation.blank?
				translation = TranslationPost.new(post: update,created_at: date,vn_id: @vn.id)
				translation.save
				#p "Translation Update successful!"
			end
		elsif vns.count > 1 
			#multiple records found matching, we need a human to verify!
			vns.each do |vn|
				title_array << vn.name
			end
			@translation = TranslationPost.where(post: update,created_at: date)
			if @translation.blank?
				translation = TranslationPost.new(post: update,created_at: date,pending: true,pending_vn_names: title_array.join(","))
				translation.save
				#p "Translation Update successful!"
			end
		else 
			# no records, manual action required
		
			@translation = TranslationPost.where(post: update,created_at: date)
			if @translation.blank?
				translation = TranslationPost.new(post: update,created_at: date,pending: true,pending_vn_names: title)
				translation.save
				#p "Translation Update successful!"
			end
		end
	end

	def get_weekly_translation_status()
	  mechanize = Mechanize.new
	  mechanize.user_agent_alias = 'Mac Safari'
	  page = mechanize.get("https://www.reddit.com/r/visualnovels/")
	  link = page.search(".side .md h4 a:nth-of-type(1)").attr("href").text.strip
	  #link_filtered = link.uri.to_s.gsub!("r/visualnovels/","")
	  link_filtered = link.gsub!("r/visualnovels/","")
	  translation_link = "https://www.reddit.com/r/visualnovels/comments" + link_filtered
	  scrape_reddit(translation_link)
	end

	get_weekly_translation_status()
	p "Success!"
	
	end