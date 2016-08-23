require 'rails_helper'

RSpec.describe Vn, type: :model do
  it {should validate_presence_of(:name)}
  it { should validate_uniqueness_of(:name).case_insensitive }
  it {should belong_to(:developer)}
  it {should belong_to(:franchise)}
  it {should have_many(:characters)}
  it {should have_many(:library_entries)}
  it {should have_many(:genres)}
  it {should have_many(:screenshots)}
  it {should have_many(:reviews)}
  it {should have_many(:publishers)}
  it {should have_many(:translation_posts)}
  it {should accept_nested_attributes_for(:characters)}
  it {should accept_nested_attributes_for(:screenshots)}
  it {should accept_nested_attributes_for(:vn_genres)}
  it {should accept_nested_attributes_for(:genres)}
  it {should accept_nested_attributes_for(:library_entries)}
  it {should accept_nested_attributes_for(:translation)}
  it {should accept_nested_attributes_for(:reviews)}
  it {should accept_nested_attributes_for(:translation_posts)}
  it {should have_one(:translation)}
end
