require "rails_helper"

feature "Destroy Blog" do
  let!(:blog) { create :blog, user: current_user }
  let!(:another_blog) { create :blog }

  include_context "current user signed in"

  scenario "As a user I can delete my blog" do
    visit blog_path(blog)

    click_link "Delete"

    expect(page).to have_content("Blog was successfully destroyed.")
  end

  scenario "As a user I can't delete not my blog" do
    visit blog_path(another_blog)

    expect(page).not_to have_link("Delete")
  end
end
