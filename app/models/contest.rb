class Contest < ActiveRecord::Base
	has_many :contest_characters,dependent: :destroy
 	accepts_nested_attributes_for :contest_characters
end
