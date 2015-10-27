class Character < ActiveRecord::Base
	validates :name, :presence => true
	validates :summary, :presence => true
	belongs_to :vn
 	mount_uploader :img_string, AvatarUploader
end
