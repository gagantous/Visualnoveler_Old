require 'rails_helper'

RSpec.describe Franchise, type: :model do
  it {should have_many(:vns)}
end
