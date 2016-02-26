require 'rake'
  desc "Rebuild Vn poster pic"
  task :rebuild_vn_poster_pic => :environment do
    Vn.all.each_with_index do |vn,index|
    	if vn.image_poster?
  			vn.image_poster.recreate_versions! 
  			puts "Recreated VN Poster Image #{index}"
  		end
      end
      puts "Complete!"
  end