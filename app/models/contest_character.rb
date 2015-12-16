class ContestCharacter < ActiveRecord::Base
  belongs_to :character
  belongs_to :contest
  mount_uploader :image, DefaultUploader
  crop_uploaded :image
end
