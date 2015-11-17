class LibraryEntry < ActiveRecord::Base
  belongs_to :vn
  belongs_to :user
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts
end
