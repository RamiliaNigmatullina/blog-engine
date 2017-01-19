require "rails_helper"

feature "Subscribe blog" do
  let(:blog) { create :blog }
  let(:current_user_blog) { create :blog, user: current_user }
  let(:subscribed_blog) { create :blog }
  let!(:subscription) { create :subscription, blog: subscribed_blog, user: current_user }

  include_context "current user signed in"

  scenario "User subscribes to blog" do
    visit blog_path(blog)

    click_link "Subscribe"

    expect(page).to have_content("Unsubcsribe")
  end

  scenario "User can't subscribe to his blog" do
    visit blog_path(current_user_blog)

    expect(page).not_to have_link("Subscribe")
  end

  scenario "User unsubscribes from blog" do
    visit blog_path(subscribed_blog)

    click_link "Unsubcsribe"

    expect(page).to have_content("Subscribe")
  end
end
