FactoryGirl.define do
  factory :user do
    name {Faker::Internet.user_name}
    email {Faker::Internet.free_email}
    after(:build) { |user| user.class.skip_callback(:create, :before, :add_to_list) }
    trait :admin do
      role 'admin'
    end
    trait :mod do
      role 'mod'
    end
    trait :writer do
      role 'writer'
    end
  end
end
