class Vn < ActiveRecord::Base
	has_many :characters
	has_many :library_entries
	has_many :posts
	has_many :favourited_by, through: :library_entries, source: :user
    has_many :vn_genres
    has_many :genres, :through => :vn_genres
    belongs_to :developer
    mount_uploader :image_coverpage, AvatarUploader
	crop_uploaded :image_coverpage 
	mount_uploader :image_1, ScreenshotUploader
	mount_uploader :image_2, ScreenshotUploader
	mount_uploader :image_3, ScreenshotUploader
	mount_uploader :image_4, ScreenshotUploader
	mount_uploader :image_poster, AvatarUploader
 	validates :name, presence: true
 	validate :cover_size
  	# validates :genre, presence: true
  	# validates :summary, presence: true
  	# validates :developer, presence: true
  	# validates :rating, presence: true
	accepts_nested_attributes_for :characters
	accepts_nested_attributes_for :vn_genres
	accepts_nested_attributes_for :genres
 	accepts_nested_attributes_for :library_entries
 	before_save :edit_youtubeurl

 	# only accepts direct copying of youtube urls
	def edit_youtubeurl
		self.trailer_url.sub!('watch?v=','embed/')
		if !self.trailer_url.include?("?autoplay=1")
			self.trailer_url << "?autoplay=1"
		end
	end

 	private 
 		def cover_size
 			if image_coverpage.size > 7.megabytes
 				errors.add(:image_coverpage,"Should be less than 7 mb")
 			end
 		end
end
