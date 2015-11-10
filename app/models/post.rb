class Post < ActiveRecord::Base
  belongs_to :LibraryEntry
  belongs_to :user
end
