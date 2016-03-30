require 'rake'
  desc "Grab VNTLS Data"
  task :vntls_data => :environment do
  	count = 0
  	def scrape_vntls(url)
		mechanize = Mechanize.new
		page = mechanize.get(url)
		content = ""
		title = page.search("#project-name").text.strip
		updates = page.search(".project-updates > tr")
		v = Vn.where(name: title)
		if !v.blank? 
			updates.each_with_index do |update,index|
				date = update.search(".week").text.strip
				description = update.search(".overflowable").text.strip
				date.gsub!("'","20")
				post = v.translation_posts.build(created_at: date,post: description)
				if post.save
					#p "post successfully saved"
				end
			#	p "Date: #{date}, #{description}"
			end

			staff = page.search(".project-staff > li")
			staff.each do |team|
				member = team.text.strip
				content << "* " + member + "\n"
			end
			t = v.build_translation
			t.content = content
			if t.save
				p "Success"
				count = count + 1
			end
		end
		sleep(2)
	end

	def parse_vntls_list(url)
		mechanize = Mechanize.new
		mechanize.user_agent = 'Mac Safari'
		p url
		begin 
			page = mechanize.get(url)
		rescue Exception => e
			page = e.page
			links = page.search("#browse-table > tbody > tr > td > a")
			temp = ""
			links.each do |link|
				url = link.attr("href").insert(0,"http://vntls.org")
				next if temp == url
				temp = url
				p url
				scrape_vntls(url)
			end
	        find_links = page.link_with(text: "next »")
	        	
	        if find_links 
	        	new_url = "http://vntls.org/browse/" + find_links.uri.to_s
	        	# new_url
	        	parse_vntls_list(new_url)
	        end
		end
	
	end

	#scrape_vntls("http://vntls.org/project/cross-channel/")
	parse_vntls_list("http://vntls.org/browse/")
	p "Amount of VNs scraped = #{count}"
 end