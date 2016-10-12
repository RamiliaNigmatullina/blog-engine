FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.paragraph(2)
    user
    post
  end
end
