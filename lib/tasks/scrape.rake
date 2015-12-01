require 'rake'
  desc "Scrape test"
  task :scrape_test => :environment do
    agent = Mechanize.new
	#Pop in your URL to work the magic
	page = agent.get("https://s.vndb.org/cv/93/6893.jpg")
	#images = page.search("img")
	d = page.save "trialimage.jpg"


  end