class NewsImage < ActiveRecord::Base
	belongs_to :news
	mount_uploader :image, NewsUploader
    validate :image_size
     private 
      def image_size
        if image.size > 5.megabytes
          errors.add(:image,"Should be less than 5 mb")
        end
      end
end
