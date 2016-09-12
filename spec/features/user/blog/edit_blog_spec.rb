require "rails_helper"

feature "Edit Blog" do
  include_context "current user signed in"

  let!(:blog) { create :blog, user: current_user }
  let!(:another_blog) { create :blog }

  scenario "As a user I can edit my blog" do
    visit edit_users_blog_path(blog)

    fill_form(:blog, name: "New Blog Name")
    click_button("Update Blog")

    expect(page).to have_content("New Blog Name")
  end

  scenario "As a user I can't edit not my blog" do
    visit blog_path(another_blog)

    expect(page).not_to have_button("Edit")
  end
end
