require 'rake'
  desc "Rebuild VN cover images"
  task :rebuild_all_vn_images => :environment do
    Vn.all.each_with_index do |vn,index|
    	if vn.image_coverpage?
  			vn.image_coverpage.recreate_versions! 
  		end
      if vn.image_poster?
        vn.image_poster.recreate_versions!
      end

      if vn.image_1?
        vn.image_1.recreate_versions!
      end

      if vn.image_2?
        vn.image_2.recreate_versions!
      end

      if vn.image_3?
        vn.image_3.recreate_versions!
      end

      if vn.image_4?
        vn.image_4.recreate_versions!
      end
      vn.save!
    end

    puts "Visual Novel Model rebuild image complete"

  end