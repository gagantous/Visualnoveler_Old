class LibraryEntry < ActiveRecord::Base
  belongs_to :vn
  belongs_to :user
end
