require "rails_helper"

feature "Create Comment" do
  let(:user) { create :user }
  let(:post) { create :post, user: user }

  include_context "current user signed in"

  background do
    visit post_path(post)
  end

  scenario "User creats comment" do
    fill_in "comment_body", with: "Comment 1"
    click_button "submit"

    open_email(post.user.email)

    expect(current_email).to have_body_text("#{current_user.full_name} commented your post '#{post.title}'")
    expect(page).to have_content("Comment 1")
  end
end
