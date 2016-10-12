class BlogDecorator < ApplicationDecorator
  delegate :id, :name, :description, :category_id, :category, :user, to: :object
  decorates_association :posts

  def subscribers_number
    "Subscribers: #{object.subscriptions.count}"
  end

  def posts_number
    "Posts: #{object.posts.count}"
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
