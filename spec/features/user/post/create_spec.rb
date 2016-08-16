require "rails_helper"

feature "Create Post" do
  include_context "current user signed in"

  background do
    visit new_post_path(current_user)
  end

  scenario "User creats post" do
    # fill_form(:post, attributes_for(:post))
    fill_form(:post, title: title)
    find("#post_body").set(body)

    click_button "Create Post"
    expect(page).to have_content("Post was successfully created.")
  end
end
