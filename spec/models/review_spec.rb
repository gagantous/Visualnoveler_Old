require 'rails_helper'

RSpec.describe Review, type: :model do
  it {should define_enum_for(:status)}
  it {should belong_to(:vn)}
  it {should belong_to(:user)}
  it {should validate_presence_of(:details)}
  it {should validate_presence_of(:rating)}
end
