class LibraryItem < ActiveRecord::Base
  belongs_to :Vn
  belongs_to :User
end
