require "rails_helper"

feature "Create Comment" do
  let!(:post) { create(:post) }

  include_context "current user signed in"

  background do
    visit post_path(post)
  end

  scenario "User creats comment" do
    fill_in "comment_body", with: "Comment 1"
    click_button "submit"

    expect(page).to have_content("Comment 1")
  end
end
