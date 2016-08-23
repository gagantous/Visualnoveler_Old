FactoryGirl.define do
  factory :translation do
    content {Faker::Lorem.paragraph}
    website {Faker::App.author}
  end
end
