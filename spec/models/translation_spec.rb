require 'rails_helper'

RSpec.describe Translation, type: :model do
  it {should belong_to(:vn)}
  it {should have_many(:translation_posts)}
  it {should accept_nested_attributes_for(:translation_posts)}
end
