class Contest < ActiveRecord::Base
	has_many :contest_characters
 	accepts_nested_attributes_for :contest_characters
end
