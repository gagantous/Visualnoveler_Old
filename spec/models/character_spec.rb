require 'rails_helper'

RSpec.describe Character, type: :model do
  it { should validate_presence_of(:name)}
  it { should have_many(:vns)}
  it { should define_enum_for(:role) }
end
