require "rails_helper"

feature "Destroy Comment" do
  let!(:first_post) { create :post }
  let!(:second_post) { create :post }
  let!(:comment) { create :comment, body: "First comment.", post: first_post, user: current_user }
  let!(:another_comment) { create :comment, body: "Second comment.", post: second_post }

  include_context "current user signed in"

  scenario "As user I can delete my comment" do
    visit post_path(first_post)

    click_link "delete"

    expect(page).not_to have_content("First comment.")
  end

  scenario "As user I can't delete not my comment" do
    visit post_path(second_post)

    expect(page).to have_content("Second comment.")
  end
end
