require "rails_helper"

feature "Create Comment" do
  let!(:post) { create(:post) }

  background do
    visit post_path(post)
  end

  scenario "Visitor can't create comment" do
    expect(page).not_to have_content("Add comment")
  end
end
