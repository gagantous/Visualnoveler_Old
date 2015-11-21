class Screenshot < ActiveRecord::Base
  belongs_to :vn
  mount_uploader :image, ScreenshotUploader
end
