require "rails_helper"

describe Like do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }
  let!(:first_like) { create(:like, user: user, post: post) }
  let!(:second_like) { build(:like, user: user, post: post) }

  it "does not allow duplicate likes per post" do
    expect(second_like).not_to be_valid
  end
end
