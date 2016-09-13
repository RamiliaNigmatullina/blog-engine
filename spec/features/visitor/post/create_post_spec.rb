require "rails_helper"

feature "Create Post" do
  background do
    visit new_users_post_path
  end

  scenario "Visitor can't create post" do
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
