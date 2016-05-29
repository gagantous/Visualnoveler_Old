class LibraryEntry < ActiveRecord::Base
  belongs_to :vn
  belongs_to :user
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts

  def self.priority_order
    order(" CASE library_entries.status
      WHEN 'watch' THEN '1'
      WHEN 'complete' THEN '2'
      WHEN 'wishlist' THEN '3'
      WHEN 'drop' THEN '4'
      WHEN 'backlog' THEN '5'
    END")

  end

end
