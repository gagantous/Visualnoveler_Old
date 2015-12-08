class Genre < ActiveRecord::Base

  validates_uniqueness_of :name
  has_many :vn_genres,dependent: :destroy
  has_many :vns, :through => :vn_genres


  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  include PgSearch
  pg_search_scope :search_by_name, :against => :name,:using => {
                    :tsearch => {:prefix => true}
                  }
end
