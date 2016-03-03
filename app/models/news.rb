class News < ActiveRecord::Base
  belongs_to :user
  has_many :images,dependent: :destroy, foreign_key: "news_id",class_name: "NewsImage"
  mount_uploader :featured_image, NewsFeaturedUploader
  acts_as_taggable
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  validate :image_size
     
	def should_generate_new_friendly_id?
  		slug.blank? || title_changed?
	end
	private 
      def image_size
        if featured_image.size > 3.megabytes
          errors.add(:featured_image,"Should be less than 3 mb")
        end
      end
end
