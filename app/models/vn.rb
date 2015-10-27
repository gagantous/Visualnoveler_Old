class Vn < ActiveRecord::Base
  	has_many :characters
 	validates :name, presence: true
  	# validates :genre, presence: true
  	# validates :summary, presence: true
  	# validates :developer, presence: true
  	# validates :rating, presence: true
	accepts_nested_attributes_for :characters
	mount_uploader :image_coverpage, AvatarUploader
	mount_uploader :image_1, AvatarUploader
	mount_uploader :image_2, AvatarUploader
	mount_uploader :image_3, AvatarUploader
	mount_uploader :image_4, AvatarUploader
	mount_uploader :image_poster, AvatarUploader
end
