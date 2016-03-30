require 'rake'
  desc "Grab VNTLS Data"
  task :vntls_data => :environment do
  	def scrape_vntls(url,name)
		mechanize = Mechanize.new
		page = mechanize.get(url)
		content = ""
		title = page.search("#project-name").text.strip
		updates = page.search(".project-updates > tr")
		vn = Vn.find_by(name: name)
		if !vn.blank? 
			updates.each_with_index do |update,index|
				date = update.search(".week").text.strip
				description = update.search(".overflowable").text.strip
				date.gsub!("'","20")
				post = vn.translation_posts.build(created_at: date,post: description)
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
			t = vn.build_translation
			t.content = content
			if t.save
				p "Success"
			end
		end
		sleep(2)
	end

	# def parse_vntls_list(url)
	# 	mechanize = Mechanize.new
	# 	mechanize.user_agent = 'Mac Safari'
	# 	p url
	# 	begin 
	# 		page = mechanize.get(url)
	# 	rescue Exception => e
	# 		page = e.page
	# 		links = page.search("#browse-table > tbody > tr > td > a")
	# 		temp = ""
	# 		links.each do |link|
	# 			url = link.attr("href").insert(0,"http://vntls.org")
	# 			next if temp == url
	# 			temp = url
	# 			p url
	# 			scrape_vntls(url)
	# 		end
	#         find_links = page.link_with(text: "next »")
	        	
	#         if find_links 
	#         	new_url = "http://vntls.org/browse/" + find_links.uri.to_s
	#         	# new_url
	#         	parse_vntls_list(new_url)
	#         end
	# 	end
	
	# end

	scrape_vntls("http://vntls.org/project/amairo-islenauts/","Amairo＊Islenauts")
	scrape_vntls("http://vntls.org/project/amaranto/","	Amaranto")
	scrape_vntls("http://vntls.org/project/anniversary-no-kuni-no-alice/","Heart no Kuni no Alice ~Wonderful Wonder World~")
	scrape_vntls("http://vntls.org/project/aoiro-rinne/","Aoiro Rinne")
	scrape_vntls("http://vntls.org/project/aoishiro/","Aoishiro")
	scrape_vntls("http://vntls.org/project/ayakashibito/","Ayakashibito")
	scrape_vntls("http://vntls.org/project/daibanchou-big-bang-age/","Daibanchou -Big Bang Age-")
	scrape_vntls("http://vntls.org/project/bokuten/","Boku ga Tenshi ni Natta Wake")
	scrape_vntls("http://vntls.org/project/yoake-mae/","Yoake Mae yori Ruri Iro na")
	scrape_vntls("http://vntls.org/project/cannonball/","Cannonball ~Neko Neko Machine Mou Race!~")
	scrape_vntls("http://vntls.org/project/bokuten/","Boku ga Tenshi ni Natta Wake")
	scrape_vntls("http://vntls.org/project/canvas2/","Canvas 2 ~Akaneiro no Palette~")
	scrape_vntls("http://vntls.org/project/cartagra/","Cartagra ~Tsuki kurui no Yamai")
	scrape_vntls("http://vntls.org/project/chou-dengeki-stryker/","Cho Dengeki Stryker")
	scrape_vntls("http://vntls.org/project/clover-days/","Clover Day's")
	scrape_vntls("http://vntls.org/project/cocoro-function/","Cocoro＠Function!")
	scrape_vntls("http://vntls.org/project/comyu/","Comyu")
	scrape_vntls("http://vntls.org/project/cross-channel-retranslation/","Cross Channel")
	scrape_vntls("http://vntls.org/project/d2b-vs-deardrops/","d2b VS Deardrops -Cross the Future-")
	scrape_vntls("http://vntls.org/project/da-capo-ii/","D.C. II ~Da Capo II~")
	scrape_vntls("http://vntls.org/project/da-capo-innocent-finale/","D.C.I.F. ~Da Capo~ Innocent Finale")
	scrape_vntls("http://vntls.org/project/da-capo-iii/","D.C. III ~Da Capo III~")
	scrape_vntls("http://vntls.org/project/danganronpa-fan/","Dangan Ronpa Kibou no Gakuen to Zetsubou no Koukousei")
	scrape_vntls("http://vntls.org/project/deardrops/","Deardrops")
	scrape_vntls("http://vntls.org/project/demonbane/","Zanmataisei Demonbane")
	scrape_vntls("http://vntls.org/project/drakoi/","Dra + Koi")
	scrape_vntls("http://vntls.org/project/duel-savior/","Duel Savior")
	scrape_vntls("http://vntls.org/project/edelweiss-eiden-fantasia/","Edelweiss Eiden Fantasia")
	scrape_vntls("http://vntls.org/project/ef-the-first-tale/","ef - a fairy tale of the two.")
	scrape_vntls("http://vntls.org/project/eroge/","Eroge! ~H mo Game mo Kaihatsu Zanmai~")
	scrape_vntls("http://vntls.org/project/comyu/","Fate/Hollow Ataraxia")
	scrape_vntls("http://vntls.org/project/fate-hollow-ataraxia/","Fate/Hollow Ataraxia")
	scrape_vntls("http://vntls.org/project/flyable-heart/","Flyable Heart -The future has already begun-")
	scrape_vntls("http://vntls.org/project/fortune-arterial/","Fortune Arterial")
	scrape_vntls("http://vntls.org/project/g-sen/","G-senjou no Maou")
	scrape_vntls("http://vntls.org/project/galaxy-angel/","Galaxy Angel")
	scrape_vntls("http://vntls.org/project/galaxy-angel-eternal-lovers/","Galaxy Angel Eternal Lovers")
	scrape_vntls("http://vntls.org/project/galaxy-angel-2/","Galaxy Angel Moonlit Lovers")
	scrape_vntls("http://vntls.org/project/forest/","Forest")
	scrape_vntls("http://vntls.org/project/grisaia-no-kajitsu/","Grisaia no Kajitsu Le Fruit De La Grisaia")
	scrape_vntls("http://vntls.org/project/grisaia-no-meikyuu/","Grisaia no Meikyuu")
	scrape_vntls("http://vntls.org/project/forest/","Forest")
	scrape_vntls("http://vntls.org/project/hadaka-shitsuji/","Hadaka Shitsuji")
	scrape_vntls("http://vntls.org/project/harukoi-otome/","Harukoi Otome ~Otome no Sono de Gokigenyou~")
	scrape_vntls("http://vntls.org/project/hatsuyuki-sakura-umikaze/","Hatsuyuki Sakura")
	scrape_vntls("http://vntls.org/project/harukoi-otome/","Harukoi Otome ~Otome no Sono de Gokigenyou~")
	scrape_vntls("http://vntls.org/project/hoshimemo/","Hoshizora no Memoria -Wish upon a Shooting Star-")
	scrape_vntls("http://vntls.org/project/higurashi-when-they-cry/","Higurashi no Naku Koro ni")
	scrape_vntls("http://vntls.org/project/harukoi-otome/","Harukoi Otome ~Otome no Sono de Gokigenyou~")
	scrape_vntls("http://vntls.org/project/i-o/","I/O")
	scrape_vntls("http://vntls.org/project/ikinari-anata-ni-koishiteiru/","Ikinari Anata ni Koishiteiru")
	scrape_vntls("http://vntls.org/project/inganock/","Sekien no Inganock -What a Beautiful People-")
	scrape_vntls("http://vntls.org/project/kara-no-shoujo/","Kara no Shoujo")
	scrape_vntls("http://vntls.org/project/katahane/","Katahane")
	scrape_vntls("http://vntls.org/project/killer-queen/","Killer Queen")
	scrape_vntls("http://vntls.org/project/kira-kira-curtain-call/","Kira☆Kira")
	scrape_vntls("http://vntls.org/project/koi-iro-chu-lips/","Koi iro Chu! Lips")
	scrape_vntls("http://vntls.org/project/koichoco/","Koi to Senkyo to Chocolate")
	scrape_vntls("http://vntls.org/project/koihime-musou/","Koihime † Musou ~Doki ☆ Otome Darake no Sangokushi Engi~")
	scrape_vntls("http://vntls.org/project/koiken-otome/","Koiken Otome")
	scrape_vntls("http://vntls.org/project/koisuru-natsu-no-last-resort/","Koisuru Natsu no Last Resort")
	scrape_vntls("http://vntls.org/project/kud-wafter/","Kud Wafter")
	scrape_vntls("http://vntls.org/project/kourin-no-machi/","Kourin no Machi, Lavender no Shoujo")
	scrape_vntls("http://vntls.org/project/kurukuru-fanatic/","Kurukuru Fanatic")
	scrape_vntls("http://vntls.org/project/lamune/","Lamune")
	scrape_vntls("http://vntls.org/project/little-busters/","Little Busters!")
	scrape_vntls("http://vntls.org/project/mahoyo/","Mahoutsukai no Yoru")
	scrape_vntls("http://vntls.org/project/mikukiss/","Mirai no Kimi to, Subete no Uta ni")
	scrape_vntls("http://vntls.org/project/moero-downhill-night-blaze/","Moero Downhill Night Blaze")
	scrape_vntls("http://vntls.org/project/muv-luv/","Muv-Luv")
	scrape_vntls("http://vntls.org/project/muv-luv-alternative/","Muv-Luv Alternative")
	scrape_vntls("http://vntls.org/project/narcissu-2nd/","Narcissu Side 2nd")
	scrape_vntls("http://vntls.org/project/never7/","Never7 -The End of Infinity-")
	scrape_vntls("http://vntls.org/project/osadai/","Osananajimi wa Daitouryou: My Girlfriend is the President")
	scrape_vntls("http://vntls.org/project/otoboku/","Otome wa Boku ni Koishiteru")
	scrape_vntls("http://vntls.org/project/paca-plus/","Paca Plus")
	scrape_vntls("http://vntls.org/project/period/","Period")
	scrape_vntls("http://vntls.org/project/paca-plus/","Paca Plus")
	scrape_vntls("http://vntls.org/project/persona-phantom-of-the-opera/","PersonA ~Opera Za no Kaijin~")
	scrape_vntls("http://vntls.org/project/phenomeno/","Phenomeno - Mitsurugi Yoishi wa Kowagaranai")
	scrape_vntls("http://vntls.org/project/planetarian/","Planetarian: The Reverie of a Little Planet")
	scrape_vntls("http://vntls.org/project/princess-evangile/","Prince Maker - Braveness")
	scrape_vntls("http://vntls.org/project/persona-phantom-of-the-opera/","Princess Evangile")
	scrape_vntls("http://vntls.org/project/princess-maker-5/","Princess Maker 5")
	scrape_vntls("http://vntls.org/project/pure-pure/","Pure Pure")
	scrape_vntls("http://vntls.org/project/quartett/","Quartett!")
	scrape_vntls("http://vntls.org/project/rance-6/","Rance VI - Zeth Houkai -")
	scrape_vntls("http://vntls.org/project/rance-quest/","Rance Quest")
	scrape_vntls("http://vntls.org/project/really-really/","Really? Really!")	
	scrape_vntls("http://vntls.org/project/remember11/","Remember11 -The Age of Infinity-")
	scrape_vntls("http://vntls.org/project/rewrite/","Rewrite")
	scrape_vntls("http://vntls.org/project/rin-utau/","Rin ga Utau, Mirai no Neiro")
	scrape_vntls("http://vntls.org/project/romanesque/","Littlewitch Romanesque: Editio Regia")
	scrape_vntls("http://vntls.org/project/rose-guns-days/","Rose Guns Days")
	scrape_vntls("http://vntls.org/project/saya-no-uta/","Saya no Uta")
	scrape_vntls("http://vntls.org/project/sayonara-wo-oshiete/","Sayonara wo Oshiete ~Comment te Dire Adieu~")
	scrape_vntls("http://vntls.org/project/trample-on-schatten/","Trample on "Schatten!!" ~Kagefumi no Uta~")
	scrape_vntls("http://vntls.org/project/seinarukana/","Seinarukana -The Spirit of Eternity Sword 2-")
	scrape_vntls("http://vntls.org/project/sengoku-rance/","Sengoku Rance")
	scrape_vntls("http://vntls.org/project/sharin/","Sharin no Kuni, Himawari no Shoujo")
	scrape_vntls("http://vntls.org/project/school-days/","PersonA ~Opera Za no Kaijin~")
	scrape_vntls("http://vntls.org/project/shikkoku-no-sharnoth/","Shikkoku no Sharnoth -What a Beautiful Tomorrow-")
	scrape_vntls("http://vntls.org/project/shiny-days/","Shiny Days")
	scrape_vntls("http://vntls.org/project/shuffle/","Shuffle!")
	scrape_vntls("http://vntls.org/project/silver-chaos/","Silver Chaos")
	scrape_vntls("http://vntls.org/project/soul-link/","Soul Link")
	scrape_vntls("http://vntls.org/project/starry-sky-after-spring/","Starry?Sky ~After Autumn~")
	scrape_vntls("http://vntls.org/project/steins-gate/","Steins;Gate")
	scrape_vntls("http://vntls.org/project/subahibi/","Subarashiki Hibi ~Furenzoku Sonzai~")
	scrape_vntls("http://vntls.org/project/armored-warrior-iris/","Soukou Kijo Iris")
	scrape_vntls("http://vntls.org/project/sumaga/","Sumaga")
	scrape_vntls("http://vntls.org/project/supreme-candy/","Supreme Candy ~Oudou ni wa Oudoutaru Riyuu ga Arun desu!~")
	scrape_vntls("http://vntls.org/project/symphonic-rain/","Symphonic Rain")
	scrape_vntls("http://vntls.org/project/tokeijikake-no-ley-line-tasogaredoki-no-kyoukaisen/","Tokeijikake no Ley Line -Asagiri ni Chiru Hana-")
	scrape_vntls("http://vntls.org/project/lamune/","Tokeijikake no Ley Line -Asagiri ni Chiru Hana-")
	scrape_vntls("http://vntls.org/project/tenshin-ranman/","Tenshin Ranman - Lucky or Unlucky!?")
	scrape_vntls("http://vntls.org/project/tick-tack/","Tick! Tack!")
	scrape_vntls("http://vntls.org/project/to-heart-2/","To Heart 2")
	scrape_vntls("http://vntls.org/project/togainu-no-chi/","Togainu no Chi")
	scrape_vntls("http://vntls.org/project/tomoyo-after/","Tomoyo After ~It's a Wonderful Life~")
	scrape_vntls("http://vntls.org/project/umineko/","Umineko no Naku Koro ni")
	scrape_vntls("http://vntls.org/project/white-album-2/","White Album 2 ~Closing Chapter~")
	scrape_vntls("http://vntls.org/project/witchs-garden/","Witch's Garden")
	scrape_vntls("http://vntls.org/project/yosuga-no-sora/","Yosuga no Sora")
	scrape_vntls("http://vntls.org/project/yumina-the-ethereal/","Yumina the Ethereal - Kikouyoku Senki Tenkuu no Yumina")
	p "Succesfully scraped all data"

	#parse_vntls_list("http://vntls.org/browse/")
 end