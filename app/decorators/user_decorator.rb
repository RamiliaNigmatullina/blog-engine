class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :username, :email, :subscriptions, :posts, :blogs, :subscribed_blogs,
    :profile_image_attacher, :profile_image

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def posts_number
    "Posts number: #{object.posts.count}"
  end

  def comments_number
    object.comments.count
  end

  def full_name_with_username
    "#{object.full_name} (#{object.username})"
  end

  def user_blogs
    "#{object.full_name}'s blogs: "
  end
end
