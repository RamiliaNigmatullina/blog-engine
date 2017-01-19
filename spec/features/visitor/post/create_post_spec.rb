require "rails_helper"

feature "Create Post" do
  scenario "Visitor can't create post" do
    visit new_users_post_path

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
