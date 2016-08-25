class BlogsController < ApplicationController
  respond_to :html

  expose_decorated :blog
  expose_decorated :blogs

  def index
  end

  def show
    return unless current_user.present?
    @subscription = Subscription.find_by blog_id: blog.id, user_id: current_user.id
  end
end
