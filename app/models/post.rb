class Post < ActiveRecord::Base
  belongs_to :library_entry
  belongs_to :user
  belongs_to :vn

  # validate :post_limits, :on => :create

  # def post_limits
  #   if self.user.posts.count >= 3
  #     errors.add(:base, "Exceeded post limit")
  #   end
  # end
end
