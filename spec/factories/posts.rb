FactoryGirl.define do
  factory :post do
    detail {Faker::Lorem.paragraph}
  end
end
