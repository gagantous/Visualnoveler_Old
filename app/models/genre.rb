class Genre < ActiveRecord::Base

  validates_uniqueness_of :name
  has_many :vn_genres
  has_many :vns, :through => :vn_genres


  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
