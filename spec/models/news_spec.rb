require 'rails_helper'

RSpec.describe News, type: :model do
  it {should belong_to(:user)}
  it {should have_many(:images)} 
end
