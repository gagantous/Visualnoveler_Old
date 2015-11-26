class Vn < ActiveRecord::Base
	has_many :characters, dependent: :destroy
	has_many :library_entries, dependent: :destroy
    has_many :vn_genres,dependent: :destroy
    has_many :genres, :through => :vn_genres
    has_many :screenshots, dependent: :destroy
    belongs_to :developer
    mount_uploader :image_coverpage, AvatarUploader
	crop_uploaded :image_coverpage 
	mount_uploader :image_1, ScreenshotUploader
	mount_uploader :image_2, ScreenshotUploader
	mount_uploader :image_3, ScreenshotUploader
	mount_uploader :image_4, ScreenshotUploader
	mount_uploader :image_poster, AvatarUploader
 	validates :name, presence: true, uniqueness: {case_sensitive: false}
 	validate :cover_size
	accepts_nested_attributes_for :characters
 	accepts_nested_attributes_for :screenshots
	accepts_nested_attributes_for :vn_genres
	accepts_nested_attributes_for :genres
 	accepts_nested_attributes_for :library_entries
 	before_save :edit_youtubeurl
  	attr_accessor :characterurl
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]

 	# only accepts direct copying of youtube urls
	def edit_youtubeurl
		if !trailer_url.empty?
			self.trailer_url.sub!('watch?v=','embed/')
			if !self.trailer_url.include?("?autoplay=1")
				self.trailer_url << "?autoplay=1"
			end
		end
	end


 	private 
 		def cover_size
 			if image_coverpage.size > 7.megabytes
 				errors.add(:image_coverpage,"Should be less than 7 mb")
 			end
 		end
end
