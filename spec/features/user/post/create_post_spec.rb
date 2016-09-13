require "rails_helper"

feature "Create Post" do
  let!(:blog) { create :blog, user: current_user, name: "Frugal Traveler" }
  let!(:tag_one) { create :tag, name: "usa" }
  let!(:tag_two) { create :tag, name: "work" }
  let!(:tag_three) { create :tag, name: "travel" }
  let!(:user) { create :user }
  let!(:subscription) { create :subscription, user: user, blog: blog }

  include_context "current user signed in"

  background do
    visit new_users_post_path(current_user)
  end

  scenario "User creats post without tags" do
    select "Frugal Traveler", from: "post_blog_id"
    fill_in "post_title", with: title
    fill_in "post_body", with: body

    click_button "Create Post"

    open_email(user.email)

    expect(current_email).to have_body_text(title)
    expect(page).to have_content("Post was successfully created.")
  end

  scenario "User creats post with tags" do
    select "Frugal Traveler", from: "post_blog_id"
    fill_in "post_title", with: title
    fill_in "post_tag_list", with: "#{tag_one.name}, #{tag_two.name}, #{tag_three.name}"
    fill_in "post_body", with: body

    click_button "Create Post"

    open_email(user.email)

    expect(current_email).to have_body_text(title)
    expect(page).to have_content("Post was successfully created.")
  end
end
