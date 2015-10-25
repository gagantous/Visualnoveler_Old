class Character < ActiveRecord::Base
	validates :name, :presence => true
	validates :summary, :presence => true
	belongs_to :vn
end
