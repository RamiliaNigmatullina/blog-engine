class BlogDecorator < ApplicationDecorator
  decorates_association :posts
  delegate :id, :name, :description, :category_id, :category

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

  def category
    "Category: #{object.category.name}"
  end
end
