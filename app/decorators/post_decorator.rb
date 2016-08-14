class PostDecorator < ApplicationDecorator
  delegate :blog_id, :user_id, :title

  def created_at
    "#{object.created_at.strftime('%b %e, %Y')} at #{object.created_at.strftime('%H:%M')}"
  end

  def short_body
    h.truncate object.body, length: 500
  end

  def comments_count
    "Commets (#{object.comments.length})"
  end
end
