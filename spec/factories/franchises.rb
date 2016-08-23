FactoryGirl.define do
  factory :franchise do
    name {Faker::Book.publisher}
  end
end
