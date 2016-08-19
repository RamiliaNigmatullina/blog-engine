class BlogDecorator < ApplicationDecorator
  decorates_association :posts
  delegate :id, :name, :category_id

  def subscribers_number
    "Subscribers: #{object.users.size}"
  end

  def posts_number
    "Posts: #{object.posts.size}"
  end

  def user_full_name
    object.user.full_name
  end

  def author
    "Author: #{object.user.full_name} (#{object.user.username})"
  end

  def theme
    "Category: #{object.category.name}"
  end
end
