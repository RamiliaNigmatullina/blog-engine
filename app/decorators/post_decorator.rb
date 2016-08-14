class PostDecorator < ApplicationDecorator
  delegate_all

  def created_at
    "#{object.created_at.strftime('%b %e, %Y')} at #{object.created_at.strftime('%H:%M')}"
  end

  def short_body
    h.truncate object.body, length: 500
  end
end
