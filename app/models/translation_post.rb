class TranslationPost < ActiveRecord::Base
  belongs_to :vn
  belongs_to :translation
end
