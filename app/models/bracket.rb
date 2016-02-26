class Bracket < ActiveRecord::Base
	has_many :bracket_characters,dependent: :destroy
 	accepts_nested_attributes_for :bracket_characters
end
