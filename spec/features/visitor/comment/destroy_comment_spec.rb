require "rails_helper"

feature "Destroy Comment" do
  let(:post) { create :post }
  let!(:comment) { create :comment, body: "First comment.", post: post }

  scenario "As visitor I can't delete comment" do
    visit post_path(post)

    expect(page).not_to have_link("delete")
  end
end
