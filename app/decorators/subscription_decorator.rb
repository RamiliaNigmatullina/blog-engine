class SubscriptionDecorator < ApplicationDecorator
  delegate :blog_id, :blog

  def blog_user_full_name
    # TODO: Law of Demeter
    object.blog.user.full_name
  end
end
