FactoryGirl.define do
  factory :review do
    details {Faker::Lorem.paragraphs}
  end
end
