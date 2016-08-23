require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:name)}
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should define_enum_for(:role) }
  it {should have_many(:library_entries)}
  it {should have_many(:posts)}
  it {should have_many(:comments)}
  it {should have_many(:news)}
  it {should have_many(:reviews)}
  it {should accept_nested_attributes_for(:posts)}
  it {should accept_nested_attributes_for(:library_entries)}
end
