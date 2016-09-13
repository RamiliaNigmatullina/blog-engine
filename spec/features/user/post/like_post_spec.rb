require "rails_helper"

feature "Like Post" do
  let!(:post) { create :post }
  include_context "current user signed in"

  background do
    visit post_path(post)
  end

  scenario "User likes post" do
    click_link "Like"

    expect(page).to have_content("Unlike")
  end
end
