class Developer < ActiveRecord::Base
	validates :name, presence: true
    validates_uniqueness_of :name
	has_many :vns
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]
end
