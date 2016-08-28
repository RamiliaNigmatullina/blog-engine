FactoryGirl.define do
  factory :category do
    name { |n| "#{Faker::Lorem.characters} #{n}" }
  end
end
