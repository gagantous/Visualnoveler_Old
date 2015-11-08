class Genre < ActiveRecord::Base
  has_many :vn_genres
  has_many :vns, :through => :vn_genres
end
