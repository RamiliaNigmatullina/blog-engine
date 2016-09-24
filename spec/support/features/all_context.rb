shared_context "context" do
  let!(:blog) { create :blog, user: current_user }
  let!(:another_blog) { create :blog }


  let!(:user) { create :user }
  let!(:not_confirmed_user) { create :user }

  let!(:first_subscription) { create :subscription, blog: another_blog, user: current_user }
  let!(:second_subscription) { create :subscription, blog: blog, user: user }

  let!(:post) { create :post, user: current_user, blog: blog }
  let!(:another_post) { create :post, blog: another_blog }

  let!(:comment) { create :comment, post: another_post, user: current_user }
  let!(:another_comment) { create :comment, post: post }

  let!(:tag_one) { create :tag }
  let!(:tag_two) { create :tag }
  let!(:tag_three) { create :tag }

  let(:new_password) { "qwe123" }
  let(:user) { create :user, :not_confirmed }
  let(:unconfirmed_user) { create :user, :not_confirmed }
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }
  let(:registered_user) { User.find_by_email(user_attributes[:email]) }
end
