class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :subscriptions, :posts, :blogs, :subscribed_blogs

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end
end
