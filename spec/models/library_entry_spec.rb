require 'rails_helper'

RSpec.describe LibraryEntry, type: :model do
  it {should belong_to(:user)}
  it {should belong_to(:vn)}
  it {should have_many(:posts)}
  it {should accept_nested_attributes_for(:posts)}
end
