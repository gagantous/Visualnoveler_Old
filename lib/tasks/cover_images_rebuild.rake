require 'rake'
  desc "Rebuild VN cover images"
  task :rebuild_vn_cover => :environment do
    Vn.all.each_with_index do |vn,index|
    	if vn.image_coverpage?
  			vn.image_coverpage.recreate_versions! 
  			puts "Recreated cover_image #{index}"
  		end
      end
      puts "Complete!"
  end