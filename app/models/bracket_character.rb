class BracketCharacter < ActiveRecord::Base
  belongs_to :character
  belongs_to :bracket
  mount_uploader :image, BracketUploader
  crop_uploaded :image
end
