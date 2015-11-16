class Developer < ActiveRecord::Base
	validates :name, presence: true
	has_many :vns
end
