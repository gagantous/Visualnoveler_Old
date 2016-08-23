require 'rails_helper'

RSpec.describe Publisher, type: :model do
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:vns)}
end
