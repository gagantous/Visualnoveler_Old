class Vn < ActiveRecord::Base
  	has_many :characters
  	has_many :library_entries
  	has_many :favourited_by, through: :library_entries, source: :user
  	has_many :vn_genres
  	has_many :genres, :through => :vn_genres
 	validates :name, presence: true
  	# validates :genre, presence: true
  	# validates :summary, presence: true
  	# validates :developer, presence: true
  	# validates :rating, presence: true
	accepts_nested_attributes_for :characters
	accepts_nested_attributes_for :vn_genres
	accepts_nested_attributes_for :genres
 	accepts_nested_attributes_for :library_entries
	mount_uploader :image_coverpage, AvatarUploader
	mount_uploader :image_1, AvatarUploader
	mount_uploader :image_2, AvatarUploader
	mount_uploader :image_3, AvatarUploader
	mount_uploader :image_4, AvatarUploader
	mount_uploader :image_poster, AvatarUploader
end
