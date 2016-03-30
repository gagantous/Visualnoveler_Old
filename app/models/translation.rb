class Translation < ActiveRecord::Base
  belongs_to :vn
  has_many :translation_posts, dependent: :destroy
  accepts_nested_attributes_for :translation_posts
end
