FactoryGirl.define do
  factory :post do
    blog
    title
    body Faker::Lorem.paragraph(50)
    user
  end
end
