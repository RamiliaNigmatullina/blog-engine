require "rails_helper"

feature "Destroy Post" do
  let(:blog) { create :blog, user: current_user }
  let(:post) { create :post, user: current_user, blog: blog }
  let(:another_post) { create :post }

  include_context "current user signed in"

  scenario "As a user I can delete my post" do
    visit post_path(post)

    click_link "Delete"

    expect(page).to have_content("Post was successfully destroyed.")
  end

  scenario "As a user I can't delete not my post" do
    visit post_path(another_post)

    expect(page).not_to have_link("Delete")
  end
end
