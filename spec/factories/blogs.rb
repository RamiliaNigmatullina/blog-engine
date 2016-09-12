FactoryGirl.define do
  factory :blog do
    user
    name { |n| "Blog #{n}" }
    description { |n| "#{Faker::Lorem.words} #{n}" }
    category
  end
end
