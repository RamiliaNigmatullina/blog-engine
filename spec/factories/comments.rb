FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.paragraph(2, true, 4)
    user
    post
  end
end
