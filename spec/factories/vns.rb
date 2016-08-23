FactoryGirl.define do
  factory :vn do
    name {Faker::Internet.user_name}
    summary {Faker::Lorem.paragraphs}
    release_date{Faker::Date.between(2.days.ago, Date.today)}
  end
end
