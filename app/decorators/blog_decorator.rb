class BlogDecorator < ApplicationDecorator
  decorates_association :posts
  delegate :id

  def subscribers_number
    "Subscribers: #{object.users.size}"
  end

  def posts_number
    "Posts: #{object.posts.size}"
  end

  def user_full_name
    object.user.full_name
  end

  def user_full_name_with_username
    "#{object.user.full_name} (#{object.user.username})"
  end
end
