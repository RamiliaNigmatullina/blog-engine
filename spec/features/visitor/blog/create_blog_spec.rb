require "rails_helper"

feature "Create Blog" do
  scenario "Visitor can't create blog" do
    visit new_users_blog_path

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
