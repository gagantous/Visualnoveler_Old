class Post < ActiveRecord::Base
  belongs_to :library_entry
  belongs_to :user

end
