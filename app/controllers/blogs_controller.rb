class BlogsController < ApplicationController
  respond_to :html

  expose_decorated :blog
  expose_decorated :blogs

  expose(:subscription) { fetch_subscription }

  def index
  end

  def show
  end

  private

  def fetch_subscription
    current_user.subscriptions.where(blog_id: blog.id).first if current_user
  end
end
