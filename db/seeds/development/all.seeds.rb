FactoryGirl.create(:user, email: "brian@gmail.com", username: "brian")
FactoryGirl.create(:user, email: "peter@gmail.com", username: "peter")
FactoryGirl.create(:user, full_name: "Ramilia Nigmatullina", email: "ramilia@gmail.com", username: "ramilia")


FactoryGirl.create(:blog, name: "Film School Rejects", description: "A Website About Movies", user_id: 1, category_id: 9)
FactoryGirl.create(:blog, name: "Atlas Obscura", description: "New wonders and curiosities added to the Atlas", user_id: 2, category_id: 28)
FactoryGirl.create(:blog, name: "Frugal Traveler", description: "A New York Times Blog", user_id: 3, category_id: 28)

FactoryGirl.create(:subscription, blog_id: 1, user_id: 2)
FactoryGirl.create(:subscription, blog_id: 2, user_id: 1)
FactoryGirl.create(:subscription, blog_id: 1, user_id: 3)
FactoryGirl.create(:subscription, blog_id: 2, user_id: 3)

FactoryGirl.create(:post, title: "Harry Potter and the Philosopher's Stone", blog_id: 1, user_id: 1)
FactoryGirl.create(:post, title: "Harry Potter and the Chamber of Secrets", blog_id: 1, user_id: 1)
FactoryGirl.create(:post, title: "Harry Potter and the Prisoner of Azkaban", blog_id: 1, user_id: 1)
FactoryGirl.create(:post, title: "9 Incredible Meteorite Craters That Look Straight Out of 'Deep Impact'", blog_id: 2, user_id: 2)
FactoryGirl.create(:post, title: "Spitzhäuschen in Bernkastel-Kues, Germany", blog_id: 2, user_id: 2)
FactoryGirl.create(:post, title: "A Move for the Frugal Traveler", blog_id: 3, user_id: 3)
FactoryGirl.create(:post, title: "Is New York’s New Bike-Sharing Program Good for Tourists?", blog_id: 3, user_id: 3)

FactoryGirl.create(:post, title: "Now You See Me", blog_id: 1, user_id: 1)
FactoryGirl.create(:post, title: "Inception", blog_id: 1, user_id: 1)
FactoryGirl.create(:post, title: "Good Will Hunting", blog_id: 1, user_id: 1)
FactoryGirl.create(:post, title: "The Lord of the Rings", blog_id: 1, user_id: 1)
FactoryGirl.create(:post, title: "The Departed", blog_id: 1, user_id: 1)
FactoryGirl.create(:post, title: "Sherlock Holmes", blog_id: 1, user_id: 1)
FactoryGirl.create(:post, title: "USA", blog_id: 2, user_id: 2)

FactoryGirl.create(:comment, user_id: 1, post_id: 4)
FactoryGirl.create(:comment, user_id: 1, post_id: 5)
FactoryGirl.create(:comment, user_id: 2, post_id: 1)
