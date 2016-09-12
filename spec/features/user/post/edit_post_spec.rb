require "rails_helper"

feature "Edit Post" do
  include_context "current user signed in"

  let!(:post) { create :post, user: current_user }
  let!(:another_post) { create :post }

  scenario "As a user I can edit my post" do
    visit edit_users_post_path(post)

    fill_form(:post, title: "New Post Title")
    click_button("Update Post")

    expect(page).to have_content("New Post Title")
  end

  scenario "As a user I can't edit not my post" do
    visit post_path(another_post)

    expect(page).not_to have_button("Edit")
  end
end
