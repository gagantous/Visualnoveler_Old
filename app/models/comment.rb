class Comment < ActiveRecord::Base
	belongs_to :post_author, :class_name =>"User"
	belongs_to :wall_author, :class_name =>"User"
end
