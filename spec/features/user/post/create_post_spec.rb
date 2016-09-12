require "rails_helper"

feature "Create Post" do
  let!(:blog) { create :blog, user: current_user, name: "Frugal Traveler" }

  include_context "current user signed in"

  background do
    visit new_users_post_path(current_user)
  end

  scenario "User creats post" do
    select "Frugal Traveler", from: "post_blog_id"
    fill_in "post_title", with: title
    fill_in "post_body", with: body

    click_button "Create Post"

    expect(page).to have_content("Post was successfully created.")
  end
end
