FactoryGirl.define do
  factory :tag do
    name Faker::Lorem.words(1)
    post
  end
end
