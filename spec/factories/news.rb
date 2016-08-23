FactoryGirl.define do
  factory :news do
    title {Faker::Book.title}
    content {Faker::Lorem.paragraphs}
  end
end
