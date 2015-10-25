class Vn < ActiveRecord::Base
  has_many :characters
  validates :name, presence: true
  validates :genre, presence: true
  validates :summary, presence: true
  validates :developer, presence: true
  validates :rating, presence: true
	accepts_nested_attributes_for :characters
end
