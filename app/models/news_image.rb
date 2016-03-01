class NewsImage < ActiveRecord::Base
	belongs_to :news
	mount_uploader :image, NewsUploader
    validate :image_size
     private 
      def image_size
        if image.size > 3.megabytes
          errors.add(:poster_image,"Should be less than 3 mb")
        end
      end
end
