class News < ActiveRecord::Base
  belongs_to :user
  has_many :images,dependent: :destroy, foreign_key: "news_id",class_name: "NewsImage"
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

	def should_generate_new_friendly_id?
  		slug.blank? || title_changed?
	end

end
