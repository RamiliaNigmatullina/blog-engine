FactoryGirl.define do
  factory :post do
    title
    body Faker::Lorem.paragraph(50)
    blog
    user
  end
end
