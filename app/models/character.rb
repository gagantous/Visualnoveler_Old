class Character < ActiveRecord::Base
	 validates :name, :presence => true
	# validates :summary, :presence => true
	belongs_to :vn
 	mount_uploader :img_string, AvatarUploader
 	#note to self this is a "HACK" to get nested fields working, fix this when u can
	crop_uploaded :image_coverpage  
end