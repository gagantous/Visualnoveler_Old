class Review < ActiveRecord::Base

  enum status: [:recommend,:not_recommended]
  belongs_to :user
  belongs_to :vn
end
