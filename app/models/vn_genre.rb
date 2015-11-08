class VnGenre < ActiveRecord::Base
  belongs_to :vn
  belongs_to :genre
end
