class Vn < ActiveRecord::Base
	has_many :character_vns,dependent: :destroy
	has_many :characters, :through => :character_vns
	has_many :library_entries, dependent: :destroy
  has_many :vn_genres,dependent: :destroy
  has_many :genres, :through => :vn_genres
  has_many :screenshots, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :vn_publishers, dependent: :destroy
  has_many :publishers, :through => :vn_publishers
  has_many :translation_posts, dependent: :destroy
  has_one :translation, dependent: :destroy,:class_name => "Translation", :foreign_key => "vn_id"
  enum status: {"Not Translated" => 0,"Translated" => 1,"Ongoing Translation" => 2,"OELVN" => 3}
  #If you ever edit status, head over to vn_helper to edit the enum status else advanced search for
  #status WILL BE BROKEN
  belongs_to :developer
  belongs_to :franchise
  mount_uploader :image_coverpage, AvatarUploader
	crop_uploaded :image_coverpage 
	mount_uploader :image_1, ScreenshotUploader
	mount_uploader :image_2, ScreenshotUploader
	mount_uploader :image_3, ScreenshotUploader
	mount_uploader :image_4, ScreenshotUploader
	mount_uploader :image_poster, PosterUploader
 	validates :name, presence: true, uniqueness: {case_sensitive: false}
 	validate :cover_size
	accepts_nested_attributes_for :characters
 	accepts_nested_attributes_for :screenshots
	accepts_nested_attributes_for :vn_genres
	accepts_nested_attributes_for :genres
 	accepts_nested_attributes_for :library_entries
 	accepts_nested_attributes_for :reviews
 	accepts_nested_attributes_for :translation
 	accepts_nested_attributes_for :translation_posts
 	before_save :edit_youtubeurl
  	attr_accessor :characterurl
  	include PgSearch
  	#:associated_against => { genres: [:name]},
  	pg_search_scope :search_by_name, :against => [:name,:alias],:using => {
                    :tsearch => {:prefix => true}
                  }
    scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}
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

	def should_generate_new_friendly_id?
  		slug.blank? || name_changed?
	end


 	private 
 		def cover_size
 			if image_coverpage.size > 7.megabytes
 				errors.add(:image_coverpage,"Should be less than 7 mb")
 			end
 		end
end
