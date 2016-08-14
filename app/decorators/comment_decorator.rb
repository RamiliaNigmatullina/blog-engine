class CommentDecorator < ApplicationDecorator
  delegate :body, :post

  def created_at
    "#{object.created_at.strftime('%b %e, %Y')} at #{object.created_at.strftime('%H:%M')}"
  end

  def commenter
    "#{object.user.full_name}:"
  end
end
