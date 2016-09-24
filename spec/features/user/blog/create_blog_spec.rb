require "rails_helper"

feature "Create Blog" do
  let!(:category) { create :category }
  let(:blog_attributes) { attributes_for(:blog).slice(:name, :description) }

  include_context "current user signed in"

  background do
    visit new_users_blog_path(current_user)
  end

  scenario "User creats blog" do
    fill_form(:blog, blog_attributes)

    click_button "Create Blog"

    expect(page).to have_content("Blog was successfully created.")
  end
end
