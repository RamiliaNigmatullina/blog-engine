class PostDecorator < ApplicationDecorator
  # delegate :title, :body, :photo, :blog, :comments, :blog_id, :user_id, :id, :tags
  delegate_all

  def created_at
    "#{object.created_at.strftime('%b %e, %Y')} at #{object.created_at.strftime('%H:%M')}"
  end

  def short_body
    h.truncate object.body.html_safe, length: 500, escape: false
  end

  def comments_count
    "Comments (#{object.comments.count})"
  end

  def likes
    "Likes: #{object.likes.count}"
  end
end
