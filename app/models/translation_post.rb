class TranslationPost < ActiveRecord::Base
  belongs_to :vn
  belongs_to :translation
  after_create :check_for_translation

  def check_for_translation
  	if !self.vn.blank? && self.vn.translation.blank?
  		self.vn.build_translation.save
  	end
  end
end
