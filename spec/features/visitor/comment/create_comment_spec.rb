require "rails_helper"

feature "Create Comment" do
  let!(:post) { create(:post) }

  scenario "Visitor can't create comment" do
    visit post_path(post)

    expect(page).not_to have_content("Add comment")
  end
end
