require 'rails_helper'

RSpec.describe TranslationPost, type: :model do
  it {should belong_to(:vn)}
  it {should belong_to(:translation)}
end
