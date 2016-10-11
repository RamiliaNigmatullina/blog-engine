require "rails_helper"

describe Subscription do
  let!(:user) { create(:user) }
  let!(:blog) { create(:blog) }
  let!(:first_subscription) { create(:subscription, user: user, blog: blog) }
  let!(:second_subscription) { build(:subscription, user: user, blog: blog) }

  it "does not allow duplicate subscriptions per blog" do
    expect(second_subscription).not_to be_valid
  end
end
