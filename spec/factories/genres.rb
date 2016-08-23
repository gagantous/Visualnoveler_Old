FactoryGirl.define do
  factory :genre do
    name {Faker::Commerce.color}
  end
end
