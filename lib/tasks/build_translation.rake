require 'rake'
  desc "Build translation for VN if empty"
  task :build_translation => :environment do

  	Vn.find_each do |vn|
  	  if vn.translation.blank? && !vn.translation_posts.blank?
        vn.build_translation.save
        p "detect #{vn.name}"
      end
		end

  	p "Successfully build translations"
	end