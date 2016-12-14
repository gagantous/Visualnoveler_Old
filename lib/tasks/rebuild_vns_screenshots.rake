require 'rake'
  desc "Rebuild VN cover images"
  task :rebuild_all_screenshots => :environment do
   
    Screenshot.all.each_with_index do |ss,index|
      if ss.image?
        ss.image.recreate_versions!
      end
    end

    puts "Screenshot Model rebuild image complete"
  end