FactoryGirl.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { |n| "#{Faker::Lorem.words} #{n}" }
  sequence(:body) { |n| "#{Faker::Lorem.paragraphs} #{n}" }
end
