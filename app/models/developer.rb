class Developer < ActiveRecord::Base
	validates :name, presence: true
    validates_uniqueness_of :name
	has_many :vns
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]
	include PgSearch
  	pg_search_scope :search_by_name, :against => :name,:using => {
                    :tsearch => {:prefix => true}
                  }

 	scope :highest_vns, -> {
      select('developers.*, COUNT(vns.id) AS vns_count').
      joins(:vns).                                                   
      group('developers.id').
      order('vns_count DESC')

	}
end
