FactoryGirl.define do
  factory :blog do
    user
    name { |n| "#{Faker::Lorem.words} #{n}" }
    category
    description { |n| "#{Faker::Lorem.words} #{n}" }
  end
end
