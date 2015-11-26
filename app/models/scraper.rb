require 'Mechanize'

class Scraper
	def initialize(vn,url)

		mechanize = Mechanize.new
		#Pop in your URL to work the magic
		page = mechanize.get(url) 

		protagonistname = page.search('table > thead > tr > td > a')[0].text.strip
		protagonistdescription = page.search('table > .nostripe > .chardesc > p')[0].text.strip
		protagonistdescription.gsub!("<hidden by spoiler settings>","")
		protagonistdescription.gsub!("\u2019s","")
		protagonistdescription.gsub!("[Edited from Wikipedia]","")
		protagonistdescription.gsub!("\"","")
		protagonistdescription.gsub!("[From Wikipedia]","")
		protagonistimg = page.search('div > div > img')[0].attr('src').gsub!("//","https://")

		#create!
		character = vn.characters.build(name: protagonistname,summary: protagonistdescription,remote_img_string_url: protagonistimg)

		mainchar = page.search('.mainbox')[2].search('table')
		maincharimgs = page.search('.mainbox')[2].search('div > div > img')
		charnames = []
		chardescriptions = []
		charimages = []

		maincharimgs.each do |char|
			url = char.attr('src').gsub!("//","https://")
			charimages << url
		end

		mainchar.each do |char|
			name = char.search('thead > tr > td > a').text.strip
			charnames << name
			description = char.search('.nostripe > td > p').text
			description.gsub!("<hidden by spoiler settings>","")
			description.gsub!("\u2019s","")
			description.gsub!("[Edited from Wikipedia]","")
			description.gsub!("[From Wikipedia]","")
			description.gsub!("\"","")
			chardescriptions << description
		end
		# # p charnames
		# # p chardescriptions
		# #p charimages


		# ###### side character section #######

		sidechar = page.search('.mainbox')[3].search('table')
		sidecharimgs = page.search('.mainbox')[3].search('div > div > img')
		sidecharnames = []
		sidechardescriptions = []
		sidecharimages = []

		sidechar.each do |char|
			name = char.search('thead > tr > td > a').text.strip
			description = char.search('.nostripe > td > p').text
			description.gsub!("<hidden by spoiler settings>","")
			description.gsub!("\u2019s","")
			description.gsub!("[Edited from Wikipedia]","")
			description.gsub!("[From Wikipedia]","")
			description.gsub!("\"","")
			sidecharnames << name
			sidechardescriptions << description
		end

		sidecharimgs.each do |char|
			url = char.attr('src').gsub!("//","https://")
			sidecharimages << url
		end

		 num = charnames.count - 1
		 (0..num).each do |i|
		 	character = vn.characters.build(name: charnames[i],summary: chardescriptions[i],remote_img_string_url: charimages[i])
		 end
		 # write side characters
		 num = sidechar.count - 1
		 (0..num).each do |i|
		 	character = vn.characters.build(name: sidecharnames[i],summary: sidechardescriptions[i],remote_img_string_url: sidecharimages[i])
		 end

		# #Write to character.txt

		# char_file = File.open("character.txt","w") {|f|

		# # protagonist
		#  f.truncate(0)
		#  f.puts(protagonistname,protagonistimg,protagonistdescription) 
		#  f.write("\n")

		#  #write main characters
		#  num = charnames.count - 1
		#  (0..num).each do |i|
		#  	f.puts(charnames[i],charimages[i],chardescriptions[i])
		#  	f.write("\n")
		#  end
		#  # write side characters
		#  num = sidechar.count - 1
		#  (0..num).each do |i|
		#  	f.puts(sidecharnames[i],sidecharimages[i],sidechardescriptions[i])
		#  	f.write("\n")
		#  end

		# }
	end
end