FactoryGirl.define do
  factory :character do
    name {Faker::Pokemon.name}
  end
end
