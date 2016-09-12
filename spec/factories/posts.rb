FactoryGirl.define do
  factory :post do
    user
    blog
    title
    body Faker::Lorem.paragraph(50)
  end
end
