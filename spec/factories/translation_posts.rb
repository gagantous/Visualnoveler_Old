FactoryGirl.define do
  factory :translation_post do
	post {Faker::Lorem.paragraph}   
  end
end
