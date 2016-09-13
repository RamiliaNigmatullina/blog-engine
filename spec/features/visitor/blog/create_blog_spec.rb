require "rails_helper"

feature "Create Blog" do
  background do
    visit new_users_blog_path
  end

  scenario "Visitor can't create blog" do
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
