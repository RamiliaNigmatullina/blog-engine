class SubscriptionDecorator < ApplicationDecorator
  delegate :blog_id

  def blog_user_full_name
    object.blog.user.full_name
  end
end
