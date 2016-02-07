require 'rake'
  desc "Rebuild User profile pic"
  task :rebuild_user_pic => :environment do
    User.all.each_with_index do |user,index|
    	if user.poster_image?
  			user.poster_image.recreate_versions! 
  			puts "Recreated User Image #{index}"
  		end
      end
      puts "Complete!"
  end