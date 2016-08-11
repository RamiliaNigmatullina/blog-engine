require "rails_helper"

feature "Create Post" do
  include_context "current user signed in"

  background do
    visit new_post_path(current_user)
  end

  scenario "User creats post" do
    fill_form(:post, attributes_for(:post))

    # fill_form(:post, { title: "Caleb", body: "Lorem ipsum"})

    # fill_in("post_title", with: "ddd")
    # fill_in("post_body", with: "eee")

    # submit(Post, :create)
    # save_and_open_page

    click_button "Create post"
    expect(page).to have_content("Post was successfully created.")
  end
end
