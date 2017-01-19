require "rails_helper"

feature "Subscribe blog" do
  let(:blog) { create :blog }

  scenario "Visitor can't subscribe to blog" do
    visit blog_path(blog)

    expect(page).not_to have_link("Subscribe")
  end
end
