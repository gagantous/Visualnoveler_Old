class Character < ActiveRecord::Base
	 validates :name, :presence => true
	 #validates :vn_id, :presence => true 
	 #maybe we will validate vn_id one day, for now enabling it causing VN creation to be bugged because it does not exist
	# validates :summary, :presence => true
	belongs_to :vn
 	mount_uploader :img_string, ScreenshotUploader
 	#note to self this is a "HACK" to get nested fields working, fix this when u can
	crop_uploaded :image_coverpage  
end