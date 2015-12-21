class VnPublisher < ActiveRecord::Base
  belongs_to :vn
  belongs_to :publisher
end
