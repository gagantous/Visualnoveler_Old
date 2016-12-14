require 'rake'
  desc "Rebuild VN cover images"
  task :rebuild_all_others => :environment do

    User.all.each_with_index do |user,index|
      if user.poster_image?
        user.poster_image.recreate_versions!
      end

      if user.header_image?
        user.header_image.recreate_versions!
      end

      if user.library_image?
        user.library_image.recreate_versions!
      end
    end

    puts "User Model rebuild image complete"

    News.all.each_with_index do |news,index|
      if news.featured_image?
        news.featured_image.recreate_versions!
      end
    end

    puts "News Model rebuild image complete"

    NewsImage.all.each_with_index do |n,index|
      if n.image?
        n.image.recreate_versions!
      end
    end

    puts "NewsImage Model rebuild image complete"
  end